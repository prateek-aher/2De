import 'dart:convert';

import 'package:delivery/CommonWidget/Snackbar.dart';
import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:delivery/UI/Main/Home/go_to_pickup.dart';
import 'package:delivery/Utils/constants/endpoints.dart';
import 'package:delivery/Utils/enumerations.dart';
import 'package:flutter/material.dart';

class FindTaskProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  FindTaskModel? _findTaskModel;
  TaskType taskType = TaskType.none;
  FindTaskModel? get findTaskModel => _findTaskModel;
  bool gotResponse = false;
  bool postResponse = true;

  Future<dynamic> findTask(context) async {
    try {
      final response = await _apiProvider.get(FIND_TASK);
      print('FIND_TASK');
      print(response);
      if (response != null) {
        if (response["message"] != "No delivery schedule for today") {
          _findTaskModel = FindTaskModel.fromJson(response);
          taskType =
              _findTaskModel?.data!.result!.task?.taskType ?? TaskType.none;
          postResponse = !postResponse;
          if (_findTaskModel?.message == "You have successfully Got Delivery" &&
              gotResponse) {
            switch (taskType) {
              case TaskType.none:
                break;
              case TaskType.pickup:
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => GoToPickup()));
                break;
              case TaskType.drop:
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => GoToPickup()));
                break;
              case TaskType.hubPickup:
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => GoToPickup()));
                break;
              case TaskType.hubDrop:
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => GoToPickup()));
                break;
            }
          }
          gotResponse = false;
          notifyListeners();
        } else {
          reSet();
          showCustomSnackBar(context, Text("No Deliveries For Today!"));
        }
        notifyListeners();
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void changeWidget() {
    gotResponse = !gotResponse;
    notifyListeners();
  }

  void reSet() {
    gotResponse = false;
    postResponse = true;
    notifyListeners();
  }

  Future<void> onRefresh(context) async {
    findTask(context).then((_) => notifyListeners());
  }
}
