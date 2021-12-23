import 'package:delivery/UI/Auth/send_otp.dart';
import 'package:delivery/UI/Main/Homepage.dart';
import 'package:delivery/UI/Main/TakePhoto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  validateUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');
    if (token != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    } else {
      Navigator.pushReplacement(
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
