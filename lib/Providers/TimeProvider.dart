import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class TimeProvider extends ChangeNotifier {
  String _timeString = "";
  String get currentTime => _timeString;
  Future<Null> updateTimer() async {
    _timeString =
        "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
    notifyListeners();
  }

  void _getCurrentTime() {
    _timeString = "${DateFormat("Hms").format(DateTime.now())}";
    notifyListeners();
  }
}
