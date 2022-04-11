import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/constants/endpoints.dart';
import '../../Utils/constants/strings.dart';
import '../Auth/enter_phone_number.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? avatarUrl;
  String? name;
  String? phoneNumber;

  @override
  void initState() {
    super.initState();
    loadFromPrefs();
  }

  loadFromPrefs() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    avatarUrl = _pref.getString('avatar');
    name = _pref.getString('name');
    phoneNumber = _pref.getString('phone_no');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: false,
      ),
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.only(top: 40),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Profile avatar
              Container(
                height: MediaQuery.of(context).size.width * 0.35,
                child: ClipOval(
                  child: CachedNetworkImage(
                      imageUrl: (avatarUrl?.contains('no-image') ?? true)
                          ? DUMMY_USER_AVATAR_URL
                          : BASE_URL + (avatarUrl ?? '/'),
                      errorWidget: (_, __, ___) => Image.asset('assets/dummy_user.png')),
                ),
              ),
              20.h,
              // Name
              Text(
                '$name',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              6.h,
              Text('$phoneNumber', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
              16.h,
            ],
          ),
        ),
        24.h,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await showDialog(
                      context: context,
                      // barrierColor: const Color(0xffF7F9FB).withOpacity(0.8),
                      barrierColor: Colors.black.withOpacity(0.5),
                      barrierDismissible: true,
                      builder: (context) => AlertDialog(
                            backgroundColor: Colors.white,
                            title: Center(child: Text('Are you sure you want to logout?')),
                            elevation: 8,
                            actions: [
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('NO')),
                              ElevatedButton(
                                  onPressed: () async {
                                    showLoading();
                                    SharedPreferences _prefs =
                                        await SharedPreferences.getInstance();
                                    _prefs.remove('token');
                                    hideLoading();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => EnterPhoneNumber()),
                                        (route) => false);
                                  },
                                  child: Text('YES')),
                            ],
                          ));
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
                child: Text('LOGOUT')),
          ],
        ),

        // ProfileDetailsTile(
        //   icon: 'assets/power.png',
        //   title: 'Logout',
        //   subTitle: 'Click here to logout of your account.',
        //   onTap: () async {
        //     await showDialog(
        //         context: context,
        //         // barrierColor: const Color(0xffF7F9FB).withOpacity(0.8),
        //         barrierColor: Colors.black.withOpacity(0.5),
        //         barrierDismissible: true,
        //         builder: (context) => AlertDialog(
        //               backgroundColor: Colors.white,
        //               title: Center(child: Text('Are you sure you want to logout?')),
        //               elevation: 8,
        //               actions: [
        //                 OutlinedButton(
        //                     onPressed: () {
        //                       Navigator.of(context).pop();
        //                     },
        //                     child: Text('NO')),
        //                 ElevatedButton(
        //                     onPressed: () async {
        //                       showLoading();
        //                       SharedPreferences _prefs = await SharedPreferences.getInstance();
        //                       _prefs.remove('token');
        //                       hideLoading();
        //                       Navigator.pushAndRemoveUntil(
        //                           context,
        //                           MaterialPageRoute(builder: (context) => EnterPhoneNumber()),
        //                           (route) => false);
        //                     },
        //                     child: Text('YES')),
        //               ],
        //             ));
        //   },
        // ),
      ]),
    );
  }
}
