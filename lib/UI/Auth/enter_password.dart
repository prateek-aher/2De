import 'dart:convert';

import 'package:delivery/Providers/LoginProvider.dart';
import 'package:delivery/UI/Auth/forget_password.dart';
import 'package:delivery/UI/Auth/logo_widget.dart';
import 'package:delivery/Utils/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnterPassword extends StatefulWidget {
  final String number;
  const EnterPassword({required this.number});
  @override
  _EnterPasswordState createState() => _EnterPasswordState();
}

class _EnterPasswordState extends State<EnterPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [const FirstPart(), SecondPart(number: widget.number)],
      )),
    );
  }
}

// ignore: use_key_in_widget_constructors
class SecondPart extends StatelessWidget {
  final String number;
  SecondPart({required this.number});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(left: 15),
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                'Enter Password',
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline3!.fontSize,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 2.0, bottom: 0.0, left: 10.0, right: 25.0),
                child: TextFormField(
                  validator: (args) {
                    if (args!.length < 1) {
                      return "Please enter Password";
                    }
                  },
                  //focusNode: focusNodePassword,
                  controller: _pwdController,
                  //obscureText: _obscureTextPassword,
                  style: const TextStyle(
                      fontFamily: 'WorkSansSemiBold',
                      fontSize: 16.0,
                      color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: App_Color)),
                    hintText: 'enter password here ',
                    hintStyle: TextStyle(fontSize: 17.0),
                  ),
                  onFieldSubmitted: (_) {
                    //_toggleSignInButton();
                  },
                  textInputAction: TextInputAction.go,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(App_Color)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          String requestJson = json.encode({
                            "phone_no": this.number,
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
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword()));
                  },
                  child: Text(
                    'forget password',
                    style: TextStyle(
                        color: App_Color,
                        fontSize: 18,
                        decoration: TextDecoration.underline),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
