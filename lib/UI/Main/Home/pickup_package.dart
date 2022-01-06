import 'dart:convert';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/custom_appbar.dart';
import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Providers/FindTaskProvider.dart';
import 'package:delivery/UI/Main/Home/arrived_at_location.dart';
import 'package:delivery/UI/Main/Home/cannot_accept_package.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:delivery/Utils/enumerations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PickupPackage extends StatefulWidget {
  const PickupPackage({Key? key}) : super(key: key);

  @override
  State<PickupPackage> createState() => _PickupPackageState();
}

class _PickupPackageState extends State<PickupPackage> {
  Address? address;
  TaskType taskType = TaskType.none;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    taskType = context.read<FindTaskProvider>().taskType;
    address =
        context.read<FindTaskProvider>().task?.data?.result?.task?.address;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: address == null
          ? Center(
              child: Text('No address available'),
            )
          : ListView(
              shrinkWrap: true,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          taskType == TaskType.pickup
                              ? 'Pickup package'
                              : 'Drop package',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CannotAcceptPackage()));
                          },
                          icon: Icon(Icons.close))
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      12.h,
                      Text(
                        '${address!.firstname} ${address!.lastname}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      6.h,
                      // Text(
                      //   '#' +
                      //       context
                      //           .read<FindTaskProvider>()
                      //           .findTaskData!
                      //           .data!
                      //           .result!
                      //           .deliveryId
                      //           .toString(),
                      //   style: TextStyle(
                      //       fontSize: 16, fontWeight: FontWeight.w500),
                      // ),
                      Image.network(
                        'https://static9.depositphotos.com/1669785/1150/i/600/depositphotos_11506024-stock-photo-package.jpg',
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Text(
                        address!.businessName ?? '',
                        style: TextStyle(fontSize: 18),
                      ),
                      12.h,
                      Text(
                        'Flat, Floor, Building Name',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45),
                      ),
                      6.h,
                      Text(
                        '${address!.street}, ${address!.city}, ${address!.state}, ${address!.country}, ${address!.pincode}',
                        style: TextStyle(fontSize: 16),
                      ),
                      12.h,
                      Text(
                        'Landmark',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45),
                      ),
                      6.h,
                      Text(
                        '${address!.landmark}',
                        style: TextStyle(fontSize: 16),
                      ),
                      12.h,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          OutlinedButton.icon(
                            onPressed: () async {
                              await launch(
                                  'tel:+91${context.read<FindTaskProvider>().findTaskData!.data!.result!.task!.address!.phoneNo}');
                            },
                            icon: Icon(Icons.call),
                            label: Text(
                              'Call',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(16)),
                          ),
                          12.w,
                          OutlinedButton.icon(
                            onPressed: () async {
                              await launch('https://maps.google.com/?api=1&q=' +
                                  jsonEncode(
                                      '${address!.street}, ${address!.city}, ${address!.state}, ${address!.country}, ${address!.pincode}' +
                                          '&output=classic'));
                            },
                            icon: Icon(Icons.navigation),
                            label: Text('Navigate',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(16)),
                          )
                        ],
                      ),
                      12.h,
                    ],
                  ),
                ),
                48.h,
              ],
            ),
      bottomNavigationBar: address == null
          ? 0.h
          : Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: GREY7,
                    offset: Offset(0, -4),
                    blurRadius: 10,
                    spreadRadius: 0)
              ]),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: SwipeButton.expand(
                height: 68,
                thumb: Icon(Icons.double_arrow_rounded,
                    color: Colors.green, size: 28),
                thumbPadding: EdgeInsets.all(5),
                child: Text(
                  taskType == TaskType.pickup
                      ? "Arrived at pickup location"
                      : 'Arrived at drop location',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                activeThumbColor: Colors.white,
                activeTrackColor: Colors.green,
                onSwipe: () {
                  // TODO: Update delivery status
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ArrivedAtLocation()));
                },
              ),
            ),
    );
  }
}
