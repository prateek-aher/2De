import 'dart:convert';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/CustomSnackBar.dart';
import 'package:delivery/Models/TaskDetailsModel.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Utils/constants/endpoints.dart';
import '../../Utils/enumerations.dart';

class TaskDetailsProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  TaskDetailsModel _taskDetails = TaskDetailsModel();
  TaskDetailsModel get taskDetails => _taskDetails;
  TaskType get taskType => _taskDetails.data!.result!.task!.taskType;

  Future<Null> getTaskDetails({required String taskId}) async {
    showLoading();
    try {
      final response = await _apiProvider.get(TASK_DETAILS + '?task_id=$taskId');
      print('TASK_DETAILS');
      print(response);
      hideLoading();
      if (response != null && response['status'] == 'success') {
        _taskDetails = TaskDetailsModel.fromJson(response);
        notifyListeners();
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<bool> changeWeight(BuildContext context,
      {int? deliveryId, double? weight, int? cost}) async {
    showLoading();
    try {
      final response = await _apiProvider.post(
          CHANGE_WEIGHT, jsonEncode({"delivery_id": deliveryId, "weight": weight, "cost": cost}));
      print('CHANGE_WEIGHT');
      print(response);
      hideLoading();
      if (response != null && response['status'] == 'success') {
        showCustomSnackBar(context, Text(response['message']), backgroundColor: Colors.green);
        return true;
      } else {
        showCustomSnackBar(context, Text(response['message']), backgroundColor: Colors.red);
        return false;
      }
    } on Exception catch (e) {
      print(e.toString());
      return false;
    }
  }
}
