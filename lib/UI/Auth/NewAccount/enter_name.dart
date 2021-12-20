import 'package:delivery/UI/Auth/NewAccount/create_password.dart';
import 'package:delivery/UI/Auth/send_otp.dart';
import 'package:delivery/Utils/AppConstant.dart';
import 'package:flutter/material.dart';

class Entername extends StatefulWidget {
  final String number;
  const Entername({required this.number, Key? key}) : super(key: key);

  @override
  _EnternameState createState() => _EnternameState();
}

class _EnternameState extends State<Entername> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emaiController = TextEditingController();
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
                  child: Text('What is your name?',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize:
                              Theme.of(context).textTheme.headline3!.fontSize)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    'Full Name',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline6!.fontSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 0.0, left: 10.0, right: 25.0),
                  child: TextFormField(
                    controller: _nameController,
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
                      hintText: 'Write your Full name here',
                      hintStyle: TextStyle(fontSize: 17.0),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    'Email Address',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline6!.fontSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 2.0, bottom: 0.0, left: 10.0, right: 25.0),
                  child: TextFormField(
                    controller: _emaiController,
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
                      hintText: 'Write your Full name here',
                      hintStyle: TextStyle(fontSize: 17.0),
                    ),
                    onFieldSubmitted: (_) {
                      //_toggleSignInButton();
                    },
                    textInputAction: TextInputAction.go,
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
                                //if (Get.isSnackbarOpen!) Get.back();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreatePassword(
                                              number: widget.number,
                                              name: _nameController.text,
                                              email: _emaiController.text,
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
