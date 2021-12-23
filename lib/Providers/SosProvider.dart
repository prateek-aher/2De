import 'dart:async';

import 'package:flutter/material.dart';

class SosProvider extends ChangeNotifier {
  // ApiProvider _apiProvider = ApiProvider();

  bool responseGoing = false;
  bool postResponse = true;

  void fakeApiCall() {
    Timer(Duration(seconds: 3), () {
      changeWidget();
    });
  }

  void changeWidget() {
    responseGoing = !responseGoing;
    notifyListeners();
  }
}
