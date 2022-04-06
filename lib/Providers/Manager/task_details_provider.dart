import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Models/TaskDetailsModel.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:flutter/cupertino.dart';

import '../../Utils/constants/endpoints.dart';

class TaskDetailsProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  TaskDetailsModel _taskDetails = TaskDetailsModel();
  TaskDetailsModel get taskDetails => _taskDetails;

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
}
