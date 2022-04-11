import 'dart:convert';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/Snackbar.dart';
import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Models/update_delivery_status.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:delivery/UI/Main/Home/Homepage.dart';
import 'package:delivery/UI/Main/Home/go_to_location.dart';
import 'package:delivery/Utils/constants/endpoints.dart';
import 'package:delivery/Utils/enumerations.dart';
import 'package:delivery/app.dart';
import 'package:flutter/material.dart';

import '../UI/Main/Home/drop_package.dart';
import '../UI/Main/Home/pickup_package.dart';

class FindTaskProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  FindTaskModel? _findTaskModel;
  TaskType taskType = TaskType.none;
  FindTaskModel? get findTaskModel => _findTaskModel;
  bool gotResponse = false;
  bool postResponse = true;

  Future<dynamic> findTask(context) async {
    changeWidget();
    try {
      final response = await _apiProvider.get(FIND_TASK);
      print('FIND_TASK');
      print(response);
      if (response != null) {
        if (response["message"] != "No delivery schedule for today") {
          _findTaskModel = FindTaskModel.fromJson(response);
          taskType = _findTaskModel?.data!.result!.task?.taskType ?? TaskType.none;
          postResponse = !postResponse;
          if (_findTaskModel?.message == "You have successfully Got Delivery" && gotResponse) {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) => GoToLocation()));
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

  Future<Null> reachedLocation(BuildContext context) async {
    UpdateDeliveryStatusModel? model;
    int sum = 0;
    for (var value in findTaskModel!.data!.result!.task!.schedules) {
      model = await updateStatus({
        'delivery_id': value,
        'status': taskType == TaskType.pickup
            ? 'reachedPickup'
            : taskType == TaskType.hubPickup || taskType == TaskType.hubDrop
                ? 'reachedHub'
                : 'reachedDrop',
      });
      if (model?.status?.toLowerCase() == 'success') {
        sum++;
      } else {
        break;
      }
    }
    print('----- ${taskType.toString()} -----');
    if (sum == findTaskModel!.data!.result!.task!.schedules.length) {
      // if pickup or hubPickup
      if (taskType == TaskType.pickup || taskType == TaskType.hubPickup) {
        for (int i = 0; i < findTaskModel!.data!.result!.packages.length; i++) {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PickupPackage(package: findTaskModel!.data!.result!.packages[i], index: i)));
        }
      } else

      // if drop or hubDrop
      if (taskType == TaskType.drop || taskType == TaskType.hubDrop) {
        for (int i = 0; i < findTaskModel!.data!.result!.packages.length; i++) {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DropPackage(package: findTaskModel!.data!.result!.packages[i], index: i)));
        }
      }

      // TODO: Integrate service for completing a task
      showLoading();
      await taskComplete(context);
      hideLoading();

      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => Homepage()), (route) => false);
    }
  }

  Future<UpdateDeliveryStatusModel?> updateStatus(dynamic requestJson /*, context*/) async {
    try {
      showLoading();
      UpdateDeliveryStatusModel? _updateStatusModel;
      final response = await _apiProvider.post(UPDATE_DELIVERY_STATUS, jsonEncode(requestJson));
      print('UPDATE_DELIVERY_STATUS');
      print(response);
      if (response != null) {
        if (response["status"].toString().toLowerCase() == "success") {
          _updateStatusModel = UpdateDeliveryStatusModel.fromJson(response);
        } else {
          // hideLoading();
          showCustomSnackBar(navigatorKey.currentContext!,
              Text(response['message'] ?? "Something Went Wrong, Try Again!"));
        }
      }
      hideLoading();
      return _updateStatusModel;
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<Null> taskComplete(BuildContext context) async {
    ApiProvider _apiProvider = ApiProvider();
    showLoading();
    final response = await _apiProvider
        .get(TASK_COMPLETED + '?task_id=${_findTaskModel?.data?.result?.task?.taskId}');
    hideLoading();
    if (response['status'] == 'success') {
      await showCustomSnackBar(context, Text('Task completed'));
    }
  }
}
