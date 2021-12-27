import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Models/FindTaskModel.dart';
import 'package:flutter/material.dart';

class CollectPackage extends StatelessWidget {
  const CollectPackage({Key? key, required this.pickupAddress})
      : super(key: key);
  final Address pickupAddress;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Collect package',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.close))
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'To:',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              sbh(12),
              Text(
                '${pickupAddress.firstname} ${pickupAddress.lastname}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              sbh(6),
              Text(
                pickupAddress.businessName ?? '',
                style: TextStyle(fontSize: 18),
              ),
              sbh(12),
              Text(
                'Flat, Floor, Building Name',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45),
              ),
              sbh(6),
              Text(
                '${pickupAddress.area}, ${pickupAddress.street}, ${pickupAddress.city}, ${pickupAddress.state}, ${pickupAddress.country}, ${pickupAddress.pinCode}',
                style: TextStyle(fontSize: 16),
              ),
              sbh(12),
              Text(
                'Landmark',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45),
              ),
              sbh(6),
              Text(
                '${pickupAddress.landmark}',
                style: TextStyle(fontSize: 16),
              ),
              sbh(12),
              Image.network(
                'https://static9.depositphotos.com/1669785/1150/i/600/depositphotos_11506024-stock-photo-package.jpg',
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              sbh(12),
            ],
          ),
        ),
        sbh(12),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            width: double.infinity,
            height: 50,
            child:
                ElevatedButton(onPressed: () {}, child: Text('Scan and Photo')))
      ],
    );
  }
}
