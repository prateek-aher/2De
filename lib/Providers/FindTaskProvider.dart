import 'dart:convert';

import 'package:delivery/CommonWidget/Snackbar.dart';
import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:delivery/UI/Main/Home/pickup_package.dart';
import 'package:delivery/Utils/constants/endpoints.dart';
import 'package:delivery/Utils/enumerations.dart';
import 'package:flutter/material.dart';

class FindTaskProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  FindTaskModel? task;
  TaskType taskType = TaskType.none;
  FindTaskModel? get findTaskData => task;
  bool gotResponse = false;
  bool postResponse = true;

  Future<dynamic> findTask(context) async {
    try {
      final response = await _apiProvider.post(FIND_TASK, jsonEncode({}));
      print(response);
      if (response != null) {
        if (response["message"] != "No delivery schedule for today") {
          task = FindTaskModel.fromJson(response);
          taskType = task?.data!.result!.task?.taskType ?? TaskType.none;
          postResponse = !postResponse;
          if (task?.message == "You have successfully Got Delivery" &&
              gotResponse) {
            switch (taskType) {
              case TaskType.none:
                break;
              case TaskType.pickup:
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PickupPackage()));
                break;
              case TaskType.drop:
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PickupPackage()));
                break;
              case TaskType.hubpickup:
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PickupPackage()));
                break;
              case TaskType.hubdrop:
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PickupPackage()));
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
