import 'dart:async';
import 'dart:convert';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/Snackbar.dart';
import 'package:delivery/Providers/SendOtpProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class EnterOtp extends StatefulWidget {
  final String? number;
  EnterOtp({@required this.number});
  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  String otp = '';
  int durationInSeconds = 90;
  late int minutes;
  late int seconds;
  late Timer timer;
  late List<FocusNode> nodes;
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    nodes = List.generate(4, (index) => FocusNode());
    controllers = List.generate(4, (index) => TextEditingController());
    startCountDown();
  }

  void startCountDown() {
    Timer.periodic(Duration(seconds: 1), (t) {
      timer = t;
      if (durationInSeconds > 0) {
        setState(() {
          durationInSeconds--;
        });
      } else {
        setState(() {
          durationInSeconds = 0;
        });
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    nodes.forEach((element) {
      element.dispose();
    });
    controllers.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    minutes = (durationInSeconds / 60).floor();
    seconds = durationInSeconds % 60;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Center(
                  child: Image.asset(
                'assets/logo.png',
                height: 100,
                width: 100,
              )),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter OTP',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline3!.fontSize,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'OTP Sent to +91-' + this.widget.number.toString(),
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                    ),
                  ),
                  10.h,
                  InkWell(
                    highlightColor:
                        Theme.of(context).primaryColor.withOpacity(0.1),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Change Phone Number',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize:
                            Theme.of(context).textTheme.subtitle1!.fontSize,
                      ),
                    ),
                  ),
                  30.h,
                  Row(
                    children: [
                      ...List.generate(
                          4,
                          (index) => Container(
                                padding: const EdgeInsets.all(4),
                                height: 50,
                                width: 50,
                                child: TextField(
                                  controller: controllers[index],
                                  focusNode: nodes[index],
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[300]!),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  keyboardType: TextInputType.phone,
                                  toolbarOptions: ToolbarOptions(
                                      cut: false,
                                      paste: false,
                                      copy: false,
                                      selectAll: false),
                                  onChanged: (_) {
                                    if (index < 3) {
                                      if (controllers[index]
                                          .text
                                          .trim()
                                          .isNotEmpty) {
                                        nodes[index + 1].requestFocus();
                                      } else if (index > 0) {
                                        nodes[index - 1].requestFocus();
                                      }
                                    } else if (controllers[index]
                                        .text
                                        .trim()
                                        .isNotEmpty) {
                                      FocusScope.of(context).unfocus();
                                    } else {
                                      nodes[index - 1].requestFocus();
                                    }
                                  },
                                  textInputAction: TextInputAction.done,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                                // child: OTPTextField(
                                //   fieldStyle: FieldStyle.underline,
                                //   length: 4,
                                //   width: MediaQuery.of(context).size.width * 0.6,
                                //   fieldWidth: 40,
                                //   style:
                                //       TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                                //   textFieldAlignment: MainAxisAlignment.spaceAround,
                                //   keyboardType: TextInputType.phone,
                                //   onChanged: (text) {
                                //     otp = text;
                                //     print('onchanged: $otp');
                                //   },
                                //   onCompleted: (pin) {
                                //     otp = pin;
                                //     print("Completed: " + otp);
                                //     String requestJson =
                                //         json.encode({"phone_no": this.number, "otp": otp});
                                //     context
                                //         .read<SendOtpProvider>()
                                //         .verifyOtp(requestJson, context);
                                //   },
                                // ),
                              )),
                      20.w,
                      Text(
                        '${minutes < 10 ? '0' : ''}$minutes:${seconds < 10 ? '0' : ''}$seconds',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  30.h,
                  Row(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).primaryColor)),
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                otp = '';
                                controllers.forEach((element) {
                                  otp += element.text.trim();
                                });
                                print('OTP typed: $otp');
                                if (otp.isNotEmpty && otp.length == 4) {
                                  String requestJson = json.encode({
                                    "phone_no": this.widget.number,
                                    "otp": otp
                                  });
                                  await context
                                      .read<SendOtpProvider>()
                                      .verifyOtp(requestJson, context);
                                } else if (otp.length < 4) {
                                  showCustomSnackBar(context,
                                      Text('One or more fields are empty'),
                                      backgroundColor: Colors.red);
                                } else {
                                  showCustomSnackBar(
                                      context, Text('Invalid OTP'),
                                      backgroundColor: Colors.red);
                                }
                                // }
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .fontSize),
                              ))),
                      Visibility(
                          visible: durationInSeconds <= 0,
                          child: TextButton(
                              onPressed: () async {
                                String requestJson = jsonEncode(
                                    {"phone_no": "${widget.number}"});
                                await context.read<SendOtpProvider>().testCall(
                                    requestJson,
                                    widget.number ?? '',
                                    context,
                                    true);
                                setState(() {
                                  durationInSeconds = 90;
                                });
                                startCountDown();
                              },
                              child: Text('Resend OTP'))),
                    ],
                  ),
                  70.h,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
