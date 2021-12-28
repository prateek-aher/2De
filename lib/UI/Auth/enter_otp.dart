import 'dart:convert';

import 'package:delivery/Providers/SendOtpProvider.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Column(
          children: [
            Spacer(),
            Center(
                child: Image.asset(
              'assets/logo.png',
              height: 100,
              width: 100,
            )),
            Spacer(),
            SecondPart(number: widget.number)
          ],
        ),
      ),
    );
  }
}

class SecondPart extends StatelessWidget {
  final String? number;
  SecondPart({@required this.number});
  @override
  Widget build(BuildContext context) {
    var pin;
    return Container(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter Otp',
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline3!.fontSize,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Otp Sent to +91-' + this.number.toString(),
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline6!.fontSize,
            ),
          ),
          const SizedBox(height: 30),
          InkWell(
            highlightColor: Theme.of(context).primaryColor.withOpacity(0.1),
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Change Phone Number',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: Theme.of(context).textTheme.subtitle1!.fontSize,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8)),
              child: OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width * 0.6,
                fieldWidth: 40,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                keyboardType: TextInputType.phone,
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
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor)),
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
                            fontSize: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .fontSize),
                      ))),
            ],
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
