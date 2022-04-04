import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Models/task_list_model.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:flutter/material.dart';

import '../../Utils/constants/endpoints.dart';

class TaskListProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  List<Pickup> _pickupList = <Pickup>[];
  // List<Drop> _dropList = <Drop>[];
  List<Pickup> get pickupList => _pickupList;

  Future<Null> updateTaskList() async {
    showLoading();
    try {
      final response = await _apiProvider.get(TASK_LIST);
      print('TASK_LIST');
      print(response);
      hideLoading();
      if (response != null && response['status'] == 'success') {
        TaskListModel _taskList = TaskListModel.fromJson(response);
        _pickupList.clear();
        _pickupList.addAll(_taskList.data?.result?.pickups ?? <Pickup>[]);
      }
      notifyListeners();
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
