import 'package:delivery/CommonWidget/CustomSnackBar.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:flutter/material.dart';

import '../app.dart';

void showLoading() {
  showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => Center(
              child: Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
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
  showCustomSnackBar(navigatorKey.currentContext!, Text(message));
}

Divider divider() => Divider(height: 2, thickness: 1, color: Color(0xffe2e4e6));
Divider greyDivider() => Divider(height: 2, thickness: 1, color: GREY7);

extension SizedBoxExtension on num {
  SizedBox get h => SizedBox(height: this.toDouble());
  SizedBox get w => SizedBox(width: this.toDouble());
}

EdgeInsetsGeometry containerPadding() => const EdgeInsets.symmetric(horizontal: 15, vertical: 20);

OutlinedButton goBackButton(BuildContext context) => OutlinedButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: Text(
      'Go Back',
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'WorkSans',
        fontWeight: FontWeight.w500,
      ),
    ),
    style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(16)));
