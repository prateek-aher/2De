import 'package:delivery/CommonWidget/Snackbar.dart';
import 'package:delivery/Providers/SosProvider.dart';
import 'package:delivery/UI/Main/Home/help.dart';
import 'package:delivery/UI/Main/PassBook.dart';
import 'package:delivery/UI/Main/ProfileDetails.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app.dart';

void showLoading() {
  showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => Center(
              child: Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(8),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: PRIMARY_COLOR,
            ),
          ))).timeout(Duration(seconds: 30), onTimeout: () {
    Navigator.pop(navigatorKey.currentContext!);
  });
}

void hideLoading() {
  Navigator.pop(navigatorKey.currentContext!);
}

void showMessage(String message) {
  CustomSnackBar(navigatorKey.currentContext!, Text(message));
}

Divider divider() => Divider(height: 2, thickness: 1, color: Color(0xffe2e4e6));
Divider greyDivider() => Divider(height: 2, thickness: 1, color: GREY7);

SizedBox sbw(double w) => SizedBox(width: w);
SizedBox sbh(double h) => SizedBox(height: h);

PreferredSizeWidget customAppBar(BuildContext context) => AppBar(
      leading: SizedBox(),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 20, bottom: 4),
        title: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileDetails()));
          },
          child: Hero(
            tag: 'profilepicture',
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/dummy_user.png'),
              radius: 20,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: PRIMARY_COLOR,
      centerTitle: true,
      title: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Passbook()));
        },
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 24))),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                          create: (BuildContext context) => SosProvider(),
                          child: Help())));
            },
            child: Text(
              "Help!",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
        // Text('     ')
      ],
    );

enum Task { pickup, drop }

EdgeInsetsGeometry containerPadding() =>
    const EdgeInsets.symmetric(horizontal: 15, vertical: 20);
