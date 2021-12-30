import 'package:delivery/CommonWidget/Snackbar.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:delivery/Utils/endpoints.dart';
import 'package:flutter/material.dart';

// class DummyItem {
//   final String? customerName;
//   final int? deliveryId;
//   final String? imgUrl;
//
//   const DummyItem(this.customerName, this.deliveryId, this.imgUrl);
// }

class BagProvider extends ChangeNotifier {
  List<dynamic> _myBagItems = <dynamic>[];

  // STATIC DATA -----
  List<dynamic> _list = const <dynamic>[
    {
      'name': 'Hemant Sutar',
      'id': 223212,
      'url':
          'https://www.fedex.com/content/dam/fedex/us-united-states/FedEx-Office/images/2021/q1/P03110_FY20FDMLP_SignforPackagesImage_727x463.jpg',
    },
    {
      'name': 'Hemant Sutar',
      'id': 223212,
      'url':
          'https://www.fedex.com/content/dam/fedex/us-united-states/FedEx-Office/images/2021/q1/P03110_FY20FDMLP_SignforPackagesImage_727x463.jpg',
    },
    {
      'name': 'Hemant Sutar',
      'id': 223212,
      'url':
          'https://www.fedex.com/content/dam/fedex/us-united-states/FedEx-Office/images/2021/q1/P03110_FY20FDMLP_SignforPackagesImage_727x463.jpg',
    },
    {
      'name': 'Hemant Sutar',
      'id': 223212,
      'url':
          'https://www.fedex.com/content/dam/fedex/us-united-states/FedEx-Office/images/2021/q1/P03110_FY20FDMLP_SignforPackagesImage_727x463.jpg',
    },
    {
      'name': 'Hemant Sutar',
      'id': 223212,
      'url':
          'https://www.fedex.com/content/dam/fedex/us-united-states/FedEx-Office/images/2021/q1/P03110_FY20FDMLP_SignforPackagesImage_727x463.jpg',
    },
  ];
  // ----- STATIC DATA

  List<dynamic> get items => _myBagItems;
  ApiProvider _apiProvider = ApiProvider();
  Future<dynamic> getMyBag(BuildContext context) async {
    try {
      final response = await _apiProvider.get(MY_BAG);
      print(response);
      if (response != null) {
        if (response["status"] == 'success') {
          // MyBagModel _myBag = MyBagModel.fromJson(response);
          // _myBagItems = _myBag.data?.result ?? <dynamic>[];
          _myBagItems.clear();
          _myBagItems.addAll(_list);
          notifyListeners();
        } else {
          // reSet();
          CustomSnackBar(
              context, Text("Your bag is empty. Find task to fill it."));
        }
        notifyListeners();
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
