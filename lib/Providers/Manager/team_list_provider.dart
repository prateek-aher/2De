import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:flutter/material.dart';

import '../../Models/team_list_model.dart';
import '../../Utils/constants/endpoints.dart';

class TeamListProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  List<TeamMember> _listAll = <TeamMember>[];
  List<TeamMember> get listAll => _listAll;
  List<TeamMember> get listCars => _listAll.where((element) => element.type == '4wheeler').toList();
  List<TeamMember> get listBikes =>
      _listAll.where((element) => element.type == '2wheeler').toList();

  Future<Null> getTeamList() async {
    TeamListModel _teamListModel = TeamListModel();
    showLoading();
    try {
      final response = await _apiProvider.get(TEAM_LIST);
      print('TEAM_lIST');
      print(response);
      hideLoading();
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
}
