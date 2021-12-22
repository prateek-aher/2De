// ignore: file_names
import 'dart:convert';

import 'package:delivery/Providers/SendOtpProvider.dart';
import 'package:delivery/UI/Auth/logo_widget.dart';
import 'package:delivery/Utils/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SendOtp extends StatefulWidget {
  const SendOtp({Key? key}) : super(key: key);

  @override
  _SendOtpState createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {
  final TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Center(
                child: Image.asset(
              'assets/logo.png',
              height: 100,
              width: 100,
            )),
            Spacer(),
            SecondPart(_phoneNumberController)
          ],
        ),
      ),
    );
  }
}

class SecondPart extends StatelessWidget {
  final TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();
  SecondPart(this._phoneController, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello!',
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline3!.fontSize,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Welcome to 2De.',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline6!.fontSize,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Enter Your Phone Number',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.subtitle1!.fontSize,
            ),
          ),
          const SizedBox(height: 10),
          Form(
            key: _formKey,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: const Text(
                    '+91',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextFormField(
                    style: const TextStyle(fontSize: 20),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Number";
                      } else if (value.length < 10) {
                        return "Please Enter Correct Number";
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "9876543210",
                        hintStyle: TextStyle(color: Colors.grey[300]!)),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                    onFieldSubmitted: (_) {
                      print(_phoneController.text);
                      _formKey.currentState!.validate();
                    },
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(App_Color)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String requestJson = json.encode(
                          {"phone_no": "${_phoneController.text.trim()}"});
                      context.read<SendOtpProvider>().testCall(
                          requestJson, _phoneController.text.trim(), context);
                    }
                  },
                  child: Text(
                    'Get OTP',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.subtitle1!.fontSize),
                  ))),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
