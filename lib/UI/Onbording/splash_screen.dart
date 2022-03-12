import 'package:delivery/UI/Auth/enter_phone_number.dart';
import 'package:delivery/UI/Main/Home/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showHeart1 = false;
  bool showHeart2 = false;
  bool showHeart3 = false;
  bool showHeart4 = false;

  validateUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');
    if (token != null) {
      print('TOKEN: $token');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  //SuccesfullyResgestered()
                  const EnterPhoneNumber()
              //Homepage() //const SendOtp()
              ));
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      validateUser();
    });
    animateHearts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        await Future.delayed(Duration.zero, () {});
        return false;
      },
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Center(
                child: Image.asset(
              'assets/logo.png',
              height: 100,
              width: 100,
            )),
            Spacer(),
            Stack(
              children: [
                Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height / 2,
                    width: double
                        .infinity, //MediaQuery.of(context).size.width * 0.8,
                    child: Image.asset('assets/splash.png')),
                Positioned(
                    left: mq.width * 0.33,
                    top: mq.height * 0.16,
                    child: Visibility(
                      visible: showHeart1,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 32,
                      ),
                    )),
                Positioned(
                    right: mq.width * 0.4,
                    top: mq.height * 0.12,
                    child: Visibility(
                      visible: showHeart2,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 32,
                      ),
                    )),
                Positioned(
                    left: mq.width * 0.37,
                    top: mq.height * 0.08,
                    child: Visibility(
                      visible: showHeart3,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 24,
                      ),
                    )),
                Positioned(
                    right: mq.width * 0.5,
                    top: mq.height * 0.02,
                    child: Visibility(
                      visible: showHeart4,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 18,
                      ),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }

  void animateHearts() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        showHeart1 = true;
      });
    }).then((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          showHeart2 = true;
        });
      }).then((_) {
        Future.delayed(const Duration(milliseconds: 600), () {
          setState(() {
            showHeart3 = true;
          });
        }).then((_) {
          Future.delayed(const Duration(milliseconds: 900), () {
            setState(() {
              showHeart4 = true;
            });
          });
        });
      });
    });
  }
}
