import 'package:delivery/CommonWidget/Snackbar.dart';
import 'package:delivery/Utils/AppConstant.dart';
import 'package:flutter/material.dart';

import '../main.dart';

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
              color: Primary_Color,
            ),
          )));
}

void hideLoading() {
  Navigator.pop(navigatorKey.currentContext!);
}

void showMessage(String message) {
  CustomSnackBar(navigatorKey.currentContext!, Text(message));
}

Divider divider() => Divider(height: 2, thickness: 1, color: Color(0xffe2e4e6));
