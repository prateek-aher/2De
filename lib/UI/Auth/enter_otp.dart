import 'dart:convert';

import 'package:delivery/Providers/SendOtpProvider.dart';
import 'package:delivery/UI/Auth/logo_widget.dart';
import 'package:delivery/Utils/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

class EnterOtp extends StatefulWidget {
  final String? number;
  EnterOtp({@required this.number});

  @override
  _EnterOtpState createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  bool fieldValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const FirstPart(),
          SecondPart(
            number: widget.number,
          )
        ],
      )),
    );
  }
}

class SecondPart extends StatelessWidget {
  final String? number;
  SecondPart({@required this.number});
  @override
  Widget build(BuildContext context) {
    var pin;
    return Flexible(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(left: 15),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              'Enter Otp',
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline3!.fontSize,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Otp Sent to +91' + this.number.toString(),
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline6!.fontSize,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Change Phone Number',
                style: TextStyle(
                  color: App_Color,
                  fontSize: Theme.of(context).textTheme.subtitle1!.fontSize,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(4),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: OTPTextField(
                      length: 4,
                      width: MediaQuery.of(context).size.width * 0.6,
                      fieldWidth: 40,
                      style: TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.underline,
                      onCompleted: (pin) {
                        pin = pin;
                        print("Completed: " + pin);
                        String requestJson =
                            json.encode({"phone_no": this.number, "otp": pin});
                        context
                            .read<SendOtpProvider>()
                            .verifyOtp(requestJson, context);
                      },
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(App_Color)),
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      String requestJson =
                          json.encode({"phone_no": this.number, "otp": pin});
                      context
                          .read<SendOtpProvider>()
                          .verifyOtp(requestJson, context);
                      // }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.subtitle1!.fontSize),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
