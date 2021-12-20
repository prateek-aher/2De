import 'dart:convert';

import 'package:delivery/Providers/user_Registration_Provider.dart';
import 'package:delivery/UI/Auth/send_otp.dart';
import 'package:delivery/Utils/AppConstant.dart';
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
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Text('Create a password',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize:
                              Theme.of(context).textTheme.headline3!.fontSize)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    'Enter password',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline6!.fontSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 0.0, left: 10.0, right: 25.0),
                  child: TextFormField(
                      //focusNode: focusNodePassword,
                      controller: _passwordController,
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
                      validator: (args) {
                        if (args!.length < 1) {
                          return " Please Enter password";
                        } else if (args.length < 5) {
                          return "Password Should be Atleast 5 Character";
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    'Re-enter password',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline6!.fontSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 0.0, left: 10.0, right: 25.0),
                  child: TextFormField(
                    //focusNode: focusNodePassword,
                    //controller: loginPasswordController,
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
                      hintText: 'enter password here',
                      hintStyle: TextStyle(fontSize: 17.0),
                    ),
                    onFieldSubmitted: (_) {
                      //_toggleSignInButton();
                    },
                    obscureText: true,
                    textInputAction: TextInputAction.go,
                    validator: (args) {
                      if (args!.length == 4 ||
                          args != _passwordController.text) {
                        return "Password should be Same as Above";
                      }
                    },
                    //autovalidate: true,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 10),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(App_Color)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // print(
                                //     widget.email + widget.name + widget.number);
                                String requestJson = json.encode({
                                  "phone_no": widget.number,
                                  "name": widget.name,
                                  "email": widget.email,
                                  "role": "boy",
                                  "password": _passwordController.text,
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
                            ))),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    'Entered wrong number.?',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyText1!.fontSize),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SendOtp()),
                        (route) => false);
                  },
                  child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Click here to change phone number.',
                        style: TextStyle(color: App_Color, fontSize: 18),
                      )),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ));
  }
}
