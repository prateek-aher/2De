import 'dart:convert';

import 'package:delivery/Models/task_list_model.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:flutter/material.dart';

import '../../CommonWidget/CommonWidget.dart';
import '../../Utils/constants/endpoints.dart';

class TaskListProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  List<Pickup> _pickupList = <Pickup>[];
  List<Drop> _dropList = <Drop>[];
  List<Pickup> get pickupList {
    _pickupList.sort((a, b) => a.status?.compareTo(b?.status ?? '') ?? -1);
    return _pickupList;
  }

  List<Drop> get dropList {
    _dropList.sort((a, b) => a.status?.compareTo(b?.status ?? '') ?? -1);
    return _dropList;
  }

  Future<Null> refreshTaskList() async {
    // showLoading();
    try {
      final response = await _apiProvider.get(TASK_LIST);
      print('TASK_LIST');
      print(response);
      // hideLoading();
      if (response != null && response['status'] == 'success') {
        TaskListModel _taskList = TaskListModel.fromJson(response);
        _pickupList.clear();
        _dropList.clear();
        _pickupList.addAll(_taskList.data?.result?.pickups ?? <Pickup>[]);
        _dropList.addAll(_taskList.data?.result?.drops ?? <Drop>[]);
        notifyListeners();
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<Null> taskReassign({required String taskId, required String teamId}) async {
    // showLoading();
    try {
      final requestJson = {"task_id": taskId, "team_id": teamId};
      final response = await _apiProvider.post(TASK_REASSIGN, jsonEncode(requestJson));
      print('TASK_REASSIGN');
      print(response);
      // hideLoading();
      if (response != null && response['status'] == 'success') {
        await refreshTaskList();
        notifyListeners();
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
