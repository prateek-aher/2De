import 'dart:convert';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Providers/user_Registration_Provider.dart';
import 'package:delivery/UI/Auth/send_otp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePassword extends StatefulWidget {
  final String name;
  final String email;
  final String number;
  const CreatePassword(
      {required this.number, required this.email, required this.name, Key? key})
      : super(key: key);

  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create a password',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:
                              Theme.of(context).textTheme.headline3!.fontSize)),
                  sbh(24),
                  Text(
                    'Enter password',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyText1!.fontSize,
                        fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                      //focusNode: focusNodePassword,
                      controller: _password,
                      //obscureText: _obscureTextPassword,
                      style: const TextStyle(
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        hintText: 'Create your password here',
                        hintStyle:
                            TextStyle(fontSize: 17.0, color: Colors.grey[300]),
                      ),
                      onFieldSubmitted: (_) {
                        //_toggleSignInButton();
                      },
                      textInputAction: TextInputAction.go,
                      validator: (args) {
                        if (args!.length < 1) {
                          return " Please Enter password";
                        } else if (args.length < 5) {
                          return "Password Should be Atleast 5 Character";
                        }
                      }),
                  sbh(24),
                  Text(
                    'Re-enter password',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyText1!.fontSize,
                        fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    //focusNode: focusNodePassword,
                    controller: _confirmPassword,
                    //obscureText: _obscureTextPassword,
                    style: const TextStyle(
                        fontFamily: 'WorkSansSemiBold',
                        fontSize: 16.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      hintText: 'Renter password here',
                      hintStyle:
                          TextStyle(fontSize: 17.0, color: Colors.grey[300]),
                    ),
                    onFieldSubmitted: (_) {
                      //_toggleSignInButton();
                    },
                    obscureText: true,
                    textInputAction: TextInputAction.go,
                    validator: (args) {
                      if (_confirmPassword.text.trim() !=
                          _password.text.trim()) {
                        return "Passwords don't match";
                      }
                    },
                    //autovalidate: true,
                  ),
                  sbh(36),
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 100,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // print(
                                //     widget.email + widget.name + widget.number);
                                String requestJson = json.encode({
                                  "phone_no": widget.number,
                                  "name": widget.name,
                                  "email": widget.email,
                                  "role": "boy",
                                  "password": _password.text,
                                });
                                context
                                    .read<UserRegistrationProvider>()
                                    .registerUser(requestJson, context);

                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const EnterPin()));
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
                  const Spacer(),
                  Text(
                    'Entered wrong Phone Number?',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyText1!.fontSize),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SendOtp()),
                          (route) => false);
                    },
                    child: Text(
                      'Click here to Change Phone Number!',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 16),
                    ),
                  ),
                  sbh(12),
                ],
              ),
            ),
          ),
        ));
  }
}
