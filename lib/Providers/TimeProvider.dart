import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class TimeProvider extends ChangeNotifier {
  String _timeString = "";
  String get currentTime => _timeString;

  int _seconds = 0;
  bool timerRunning = false;
  int get seconds => _seconds;
  Future<Null> updateTime() async {
    // _timeString =
    //     "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
    notifyListeners();
  }

  void _getCurrentTime() {
    _timeString = "${DateFormat("Hms").format(DateTime.now())}";
    notifyListeners();
  }

  void start10minuteTimer() {
    if (!timerRunning) {
      timerRunning = true;
      _seconds = 600;
      Timer.periodic(Duration(seconds: 1), (timer) {
        if (_seconds > 0) {
          _seconds--;
        } else {
          timerRunning = false;
          _seconds = 0;
          timer.cancel();
        }
        notifyListeners();
      });
    }
  }
}
