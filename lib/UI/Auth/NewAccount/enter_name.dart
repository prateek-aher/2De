import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/UI/Auth/NewAccount/create_password.dart';
import 'package:delivery/UI/Auth/enter_phone_number.dart';
import 'package:flutter/material.dart';

class EnterName extends StatefulWidget {
  final String number;
  const EnterName({required this.number, Key? key}) : super(key: key);

  @override
  _EnterNameState createState() => _EnterNameState();
}

class _EnterNameState extends State<EnterName> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
                  Text('What is your name?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:
                              Theme.of(context).textTheme.headline3!.fontSize)),
                  24.h,
                  Text(
                    'Full Name',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyText1!.fontSize,
                        fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    controller: _fullNameController,
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
                      hintText: 'Write your full name here',
                      hintStyle:
                          TextStyle(fontSize: 17.0, color: Colors.grey[300]),
                    ),
                    onFieldSubmitted: (_) {
                      //_toggleSignInButton();
                    },
                    textInputAction: TextInputAction.go,
                    validator: (args) {
                      if (args == null) {
                        return "Please enter name";
                      } else if (args.length < 4) {
                        return "Please Enter Full name";
                      }
                    },
                  ),
                  24.h,
                  Text(
                    'Email Address',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyText1!.fontSize,
                        fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    controller: _emailController,
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
                      hintText: 'Write your email here',
                      hintStyle:
                          TextStyle(fontSize: 17.0, color: Colors.grey[300]),
                    ),
                    onFieldSubmitted: (_) {
                      //_toggleSignInButton();
                    },
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.emailAddress,
                    validator: (args) {
                      if (args!.length < 1) {
                        return "Please Enter Email";
                      } else if (args.contains(RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'))) {
                        return null;
                      } else
                        return "Enter Valid mail";
                    },
                  ),
                  // TextFormField(
                  //   controller: _emailController,
                  //   //obscureText: _obscureTextPassword,
                  //   style: const TextStyle(
                  //       fontFamily: 'WorkSansSemiBold',
                  //       fontSize: 16.0,
                  //       color: Colors.black),
                  //   decoration: InputDecoration(
                  //     enabledBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.grey)),
                  //     focusedBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                  //     hintText: 'Write your Full name here',
                  //     hintStyle: TextStyle(fontSize: 17.0),
                  //   ),
                  //   onFieldSubmitted: (_) {
                  //     //_toggleSignInButton();
                  //   },
                  //   textInputAction: TextInputAction.go,
                  //   validator: (args) {
                  //     if (args!.length < 1) {
                  //       return "Please Enter Email";
                  //     } else if (args.contains(RegExp(
                  //         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'))) {
                  //       return null;
                  //     } else
                  //       return "Enter Valid mail";
                  //   },
                  // ),
                  36.h,
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
                                //if (Get.isSnackbarOpen!) Get.back();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreatePassword(
                                              number: widget.number,
                                              name: _fullNameController.text,
                                              email: _emailController.text,
                                            )));
                              }
                              // else
                              //   showMessage('Above Fields cant be empty');
                            },
                            child: Text(
                              'Next',
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
                          MaterialPageRoute(
                              builder: (context) => EnterPhoneNumber()),
                          (route) => false);
                    },
                    child: Text(
                      'Click here to Change Phone Number!',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 16),
                    ),
                  ),
                  12.h,
                ],
              ),
            ),
          ),
        ));
  }
}
