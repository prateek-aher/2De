import 'package:delivery/Models/my_profile_model.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:delivery/Utils/AppConstant.dart';

class ProfileProvider {
  static ApiProvider _apiProvider = ApiProvider();

  static Future<MyProfileModel?> getProfile() async {
    MyProfileModel? model;
    try {
      final response = await _apiProvider.get(MY_PROFILE);
      print(response);
      if (response != null) {
        print(response);
        model = MyProfileModel.fromJson(response);
      }
      return model;
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
