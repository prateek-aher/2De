import 'dart:convert';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Providers/LoginProvider.dart';
import 'package:delivery/UI/Auth/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logo_widget.dart';

class EnterPassword extends StatefulWidget {
  final String number;
  const EnterPassword({required this.number});
  @override
  _EnterPasswordState createState() => _EnterPasswordState();
}

class _EnterPasswordState extends State<EnterPassword> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [const FirstPart(), SecondPart(number: widget.number)],
        )),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class SecondPart extends StatefulWidget {
  final String number;
  SecondPart({required this.number});

  @override
  State<SecondPart> createState() => _SecondPartState();
}

class _SecondPartState extends State<SecondPart> {
  final _formKey = GlobalKey<FormState>();
  bool isVisible = false;
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Flexible(
      flex: 1,
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            shrinkWrap: true,
            children: [
              Text('Enter Password',
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline3!.fontSize,
                      fontWeight: FontWeight.bold)),
              24.h,
              Text('Password',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14)),
              TextFormField(
                validator: (args) {
                  if (_pwdController.text.trim().length < 1) {
                    return "Please enter Password";
                  }
                },
                controller: _pwdController,
                style: const TextStyle(
                    fontFamily: 'WorkSansSemiBold',
                    fontSize: 16.0,
                    color: Colors.black),
                obscureText: !isVisible,
                decoration: InputDecoration(
                  suffix: InkWell(
                    child: Icon(
                        !isVisible ? Icons.visibility_off : Icons.visibility),
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  hintText: 'Enter your password here',
                  hintStyle: TextStyle(fontSize: 20, color: Colors.grey[300]),
                ),
                onFieldSubmitted: (_) {
                  //_toggleSignInButton();
                },
                textInputAction: TextInputAction.go,
              ),
              18.h,
              Row(
                children: [
                  SizedBox(
                    height: h * 0.06,
                    width: w * 0.35,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor)),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            String requestJson = json.encode({
                              "phone_no": this.widget.number,
                              "password": _pwdController.text
                            });
                            context
                                .read<LoginProvider>()
                                .handleLogin(requestJson, context);
                          }
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .fontSize),
                        )),
                  ),
                ],
              ),
              36.h,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ForgotPassword(phoneNumber: widget.number)));
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
