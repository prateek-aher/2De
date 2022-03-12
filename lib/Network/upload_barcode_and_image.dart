import 'dart:io';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Models/parcel_pickup.dart';
import 'package:delivery/Utils/constants/endpoints.dart';

import 'Api_Provider.dart';

class UploadService {
  static ApiProvider _apiProvider = ApiProvider();

  static Future<ParcelPickupModel?> send({
    required String deliveryId,
    required String barcode,
    required File file,
  }) async {
    ParcelPickupModel? model;
    try {
      showLoading();
      final response = await _apiProvider.multiPart(
          status: 'pickedUp',
          barcode: barcode,
          deliveryId: deliveryId,
          file: file,
          url: UPDATE_DELIVERY_STATUS);
      print(response);
      if (response != null) {
        print(response);
        model = ParcelPickupModel.fromJson(response);
      }
      hideLoading();
      return model;
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
