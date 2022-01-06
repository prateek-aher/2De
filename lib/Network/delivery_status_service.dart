// import 'dart:convert';
//
// import 'package:delivery/Models/change_password_model.dart';
// import 'package:delivery/Models/get_delivery_status.dart';
// import 'package:delivery/Network/Api_Provider.dart';
// import 'package:delivery/Providers/FindTaskProvider.dart';
// import 'package:delivery/Utils/constants/endpoints.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/src/provider.dart';
//
// class DeliveryStatusService {
//   static ApiProvider _apiProvider = ApiProvider();
//
//   static Future<DeliveryStatusModel?> getStatus(BuildContext context) async {
//     int id =
//         context.read<FindTaskProvider>().task!.data!.result!.deliveryId ?? 0;
//     DeliveryStatusModel? model;
//     try {
//       final response = await _apiProvider.post(
//           CHANGE_PASSWORD, jsonEncode({'delivery_id': id}));
//       print(response);
//       if (response != null) {
//         print(response);
//         model = DeliveryStatusModel.fromJson(response);
//       }
//       return model;
//     } on Exception catch (e) {
//       print(e.toString());
//     }
//   }
// }
