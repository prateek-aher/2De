import 'package:delivery/UI/Auth/send_otp.dart';
import 'package:delivery/UI/Main/Homepage.dart';
import 'package:delivery/UI/Main/TakePhoto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScree extends StatefulWidget {
  const SplashScree({Key? key}) : super(key: key);

  @override
  _SplashScreeState createState() => _SplashScreeState();
}

class _SplashScreeState extends State<SplashScree> {
  validateUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');
    if (token != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
          (route) => false);
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  //SuccesfullyResgestered()
                  const SendOtp()
              //Homepage() //const SendOtp()
              ));
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      validateUser();
      //Navigator.push(
      //    context, MaterialPageRoute(builder: (context) => TakePhotoScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Image.asset('assets/splash.png'))
            ],
          )
        ],
      ),
    ));
  }
}
