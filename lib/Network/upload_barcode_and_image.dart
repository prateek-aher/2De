import 'dart:io';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/Snackbar.dart';
import 'package:delivery/Models/parcel_pickup_drop_model.dart';
import 'package:delivery/Providers/FindTaskProvider.dart';
import 'package:delivery/Utils/constants/endpoints.dart';
import 'package:delivery/Utils/enumerations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Api_Provider.dart';

class UploadService {
  static ApiProvider _apiProvider = ApiProvider();

  static Future<ParcelPickupDropModel?> send({
    required BuildContext context,
    required String deliveryId,
    required String barcode,
    required File file,
  }) async {
    ParcelPickupDropModel? model;
    TaskType taskType = context.read<TaskProvider>().taskType;
    try {
      showLoading();
      final response = await _apiProvider.multiPart(
          status: taskType == TaskType.pickup || taskType == TaskType.hubPickup
              ? 'pickedUp'
              : 'delivered',
          barcode: barcode,
          deliveryId: deliveryId,
          file: file,
          url: UPDATE_DELIVERY_STATUS);
      print(response);
      if (response != null) {
        print(response);
        model = ParcelPickupDropModel.fromJson(response);
        if (model.status == 'success') {
          await showCustomSnackBar(
              context,
              Text(
                  '${taskType == TaskType.pickup || taskType == TaskType.hubPickup ? 'Picked up' : 'Delivered'}'));
        }
      }

      hideLoading();
      return model;
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
