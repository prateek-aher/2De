import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Models/dashboard_model.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:flutter/material.dart';

import '../../Utils/constants/endpoints.dart';

class DashboardProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  int pickups = 0;
  int drops = 0;
  int bikeActive = 0;
  int bikeInactive = 0;
  int carActive = 0;
  int carInactive = 0;

  Future<Null> refreshDashboard() async {
    showLoading();
    try {
      final response = await _apiProvider.get(DASHBOARD);
      print('DASHBOARD');
      print(response);
      hideLoading();
      if (response != null && response['status'] == 'success') {
        DashboardModel _dash = DashboardModel.fromJson(response);
        pickups = _dash.data?.result?.taskInfo?.pickups ?? 0;
        drops = _dash.data?.result?.taskInfo?.drops ?? 0;
        bikeActive = _dash.data?.result?.teamInfo?.bikeActive ?? 0;
        bikeInactive = _dash.data?.result?.teamInfo?.bikeInactive ?? 0;
        carActive = _dash.data?.result?.teamInfo?.carActive ?? 0;
        carInactive = _dash.data?.result?.teamInfo?.carInactive ?? 0;
      }
      notifyListeners();
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
