import 'package:flutter/material.dart';

import '../../Models/delivery_list_model.dart';
import '../../Network/Api_Provider.dart';
import '../../Utils/constants/endpoints.dart';

class DeliveryListProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  List<Delivery> _deliveryList = <Delivery>[];
  List<Delivery> get deliveryList => _deliveryList;
  Delivery dummyDelivery = Delivery.fromJson({
    "delivery_id": 53249,
    "project_id": 77783,
    "payment_id": 99033,
    "team_id": 2,
    "pickup_address": {
      "area": "APG Learning, AIMS Rd, Sakal Nagar, Aundh, Pune, Maharashtra, India",
      "city": "Pune",
      "state": "Maharashtra",
      "country": "India",
      "pincode": 411007,
      "latitude": 18.5475238,
      "longitude": 73.8202629,
      "landmark": "APG Learning, No.1, AIMS Road, Sakal Nagar, Aundh, Pune",
      "flat_no": " Test",
      "business_name": "Never stoppp",
      "firstname": "saurabh",
      "lastname": "Penkar",
      "phone_no": "8087618710"
    },
    "drop_address": {
      "firstname": "Jayesh",
      "lastname": "Desai",
      "flat_no": "Flat no.1,3rd floor",
      "street": "test",
      "area":
          "Heena Palace 1,Sr No 111, 12B, 1, Nadhe Nagar Rd, behind Jyotiba mangal karyalaya, Kalewadi, Pimpri-Chinchwad, Maharashtra 411017, India",
      "city": "Chinchwad",
      "landmark": "",
      "country": "India",
      "pincode": 411017,
      "phone_no": "9594343705"
    },
    "product_type": "Cart Order",
    "weight": 2.5,
    "pickup_time": "2022-05-05T03:30:00.000Z",
    "drop_time": "2022-05-09T03:30:00.000Z",
    "state": "Delivery Finished",
    "id": null,
    "exData": "2022-05-05T03:30:00.000Z",
    "exData1": "2022-05-05T04:30:00.000Z",
    "drop_date": "May 9, 2022",
    "drop_slot": "9 AM - 10 AM"
  });
  // List<ReturnedPackage> _returnedList = <ReturnedPackage>[];
  // List<DeliveredPackage> get deliveredList {
  //   // _deliveredList.sort((a, b) => a.status?.compareTo(b.status ?? '') ?? -1);
  //   return _deliveredList;
  // }

  // List<ReturnedPackage> get returnedList {
  //   // _returnedList.sort((a, b) => a.status?.compareTo(b.status ?? '') ?? -1);
  //   return _returnedList;
  // }

  Future<Null> refreshDeliveryList() async {
    // showLoading();
    try {
      final response = await _apiProvider.get(DELIVERY_LIST);
      print('DELIVERY_LIST');
      print(response);
      // hideLoading();
      if (response != null && response['status'] == 'success') {
        DeliveryListModel _deliveryListModel = DeliveryListModel.fromJson(response);
        _deliveryList.clear();
        // _returnedList.clear();
        _deliveryList.addAll(_deliveryListModel.data?.result ?? []);
        // _returnedList.addAll(_deliveryList.data?.result?.returned ?? <ReturnedPackage>[]);

        if (_deliveryList.isEmpty) {
          _deliveryList.add(dummyDelivery);
        }

        notifyListeners();
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
