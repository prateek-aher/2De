import 'dart:convert';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Providers/FindTaskProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PickupPackage extends StatelessWidget {
  const PickupPackage({Key? key, required this.pickupAddress})
      : super(key: key);
  final Address? pickupAddress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: pickupAddress == null
          ? Center(
              child: Text('No pickup address available'),
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
                        'Pickup package',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.close))
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
                      sbh(12),
                      Text(
                        '${pickupAddress!.firstname} ${pickupAddress!.lastname}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      sbh(6),
                      Text(
                        '#' +
                            context
                                .read<FindTaskProvider>()
                                .findTaskData!
                                .data!
                                .result!
                                .deliveryId
                                .toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Image.network(
                        'https://static9.depositphotos.com/1669785/1150/i/600/depositphotos_11506024-stock-photo-package.jpg',
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Text(
                        pickupAddress!.businessName ?? '',
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
                        '${pickupAddress!.street}, ${pickupAddress!.city}, ${pickupAddress!.state}, ${pickupAddress!.country}, ${pickupAddress!.pinCode}',
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
                        '${pickupAddress!.landmark}',
                        style: TextStyle(fontSize: 16),
                      ),
                      sbh(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          OutlinedButton.icon(
                            onPressed: () async {
                              await launch(
                                  'tel:+91${context.read<FindTaskProvider>().findTaskData!.data!.result!.pickupAddress!.phoneNo}');
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
                          sbw(12),
                          OutlinedButton.icon(
                            onPressed: () async {
                              await launch('https://maps.google.com/?api=1&q=' +
                                  jsonEncode(
                                      '${pickupAddress!.street}, ${pickupAddress!.city}, ${pickupAddress!.state}, ${pickupAddress!.country}, ${pickupAddress!.pinCode}' +
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
                      sbh(12),
                    ],
                  ),
                ),
                sbh(48),
              ],
            ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -8),
              blurRadius: 20,
              spreadRadius: 0)
        ]),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SwipeButton.expand(
          thumb: Icon(
            Icons.double_arrow_rounded,
            color: Colors.green,
          ),
          thumbPadding: EdgeInsets.all(2),
          child: Text(
            "Arrived at pickup location",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          activeThumbColor: Colors.white,
          activeTrackColor: Colors.green,
          onSwipe: () {
            // TODO: Update delivery status

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Swiped"),
                backgroundColor: Colors.green,
              ),
            );
          },
        ),
      ),
      // bottomNavigationBar: Container(
      //     decoration: BoxDecoration(color: Colors.white, boxShadow: [
      //       BoxShadow(
      //           color: Colors.black26,
      //           offset: Offset(0, -8),
      //           blurRadius: 20,
      //           spreadRadius: 0)
      //     ]),
      //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      //     child: SizedBox(
      //       height: 50,
      //       child: ElevatedButton(
      //         child: Row(
      //           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Icon(Icons.arrow_forward_rounded),
      //             Spacer(flex: 2),
      //             Text(
      //               'Arrived at pickup location',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      //             ),
      //             Spacer(flex: 3)
      //           ],
      //         ),
      //         onPressed: () {},
      //         style: ElevatedButton.styleFrom(
      //           primary: Colors.green,
      //         ),
      //       ),
      //     )),
    );
  }
}
