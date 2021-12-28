import 'package:delivery/UI/Auth/NewAccount/successfully_registerd.dart';
import 'package:flutter/material.dart';

class EnterPin extends StatefulWidget {
  const EnterPin({Key? key}) : super(key: key);

  @override
  _EnterPinState createState() => _EnterPinState();
}

class _EnterPinState extends State<EnterPin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Text('What is your Pin code?',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize:
                            Theme.of(context).textTheme.headline3!.fontSize)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  'Enter pincode',
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
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    hintText: 'enter pin here ',
                    hintStyle: TextStyle(fontSize: 17.0),
                  ),
                  onFieldSubmitted: (_) {
                    //_toggleSignInButton();
                  },
                  textInputAction: TextInputAction.go,
                ),
              ),
              Row(
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 20, bottom: 10, left: 10),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor)),
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SuccessfullyRegistered()));
                            // }
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
            ],
          ),
        ));
  }
}
