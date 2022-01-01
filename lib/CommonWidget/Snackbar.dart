import 'package:delivery/Utils/colors.dart';
import 'package:flutter/material.dart';

Future<void> showCustomSnackBar(BuildContext context, Widget content,
    {SnackBarAction? snackBarAction, Color backgroundColor = APP_COLOR}) async {
  final SnackBar snackBar = SnackBar(
      action: snackBarAction,
      backgroundColor: backgroundColor,
      content: content,
      behavior: SnackBarBehavior.floating);

  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  return;
}
