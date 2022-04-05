import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Models/team_status_change_model.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:delivery/Providers/Manager/dashboard_provider.dart';
import 'package:delivery/Utils/enumerations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/team_list_model.dart';
import '../../Utils/constants/endpoints.dart';

class TeamListProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  List<TeamMember> _listAll = <TeamMember>[];
  List<TeamMember> get listAll => _listAll;
  List<TeamMember> get listAllActive =>
      _listAll.where((element) => element.status == true).toList();
  List<TeamMember> get listCars => _listAll.where((element) => element.type == '4wheeler').toList();
  List<TeamMember> get listBikes =>
      _listAll.where((element) => element.type == '2wheeler').toList();

  Future<Null> getTeamList() async {
    TeamListModel _teamListModel = TeamListModel();
    // showLoading();
    try {
      final response = await _apiProvider.get(TEAM_LIST);
      print('TEAM_lIST');
      print(response);
      // hideLoading();
      if (response != null && response['status'] == 'success') {
        _teamListModel = TeamListModel.fromJson(response);
        _listAll.clear();
        _listAll.addAll(_teamListModel.data?.result ?? []);
      }
      notifyListeners();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<Null> changeTeamStatus(
      {required BuildContext ctx, required String teamId, required Status status}) async {
    TeamStatusChangeModel _change = TeamStatusChangeModel();
    // showLoading();
    try {
      final response = await _apiProvider.get(
          (status == Status.enable ? TEAM_STATUS_ENABLE : TEAM_STATUS_DISABLE) +
              '?team_id=$teamId');
      print(status == Status.enable ? 'TEAM_STATUS_ENABLE' : 'TEAM_STATUS_DISABLE');
      print(response);
      // hideLoading();
      if (response != null && response['status'] == 'success') {
        await getTeamList();
        await ctx.read<DashboardProvider>().refreshDashboard();
        notifyListeners();
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
