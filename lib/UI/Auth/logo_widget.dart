import 'package:flutter/material.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Center(
          child: Image.asset(
        'assets/logo.png',
        height: 100,
        width: 100,
      )),
    );
  }
}
