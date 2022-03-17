import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/custom_appbar.dart';
import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Models/update_delivery_status.dart' hide Result;
import 'package:delivery/Providers/FindTaskProvider.dart';
import 'package:delivery/UI/Main/Home/arrived_at_location.dart';
import 'package:delivery/UI/Main/Home/cannot_accept_package.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:delivery/Utils/enumerations.dart';
import 'package:delivery/Utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class GoToPickup extends StatefulWidget {
  const GoToPickup({Key? key}) : super(key: key);

  @override
  State<GoToPickup> createState() => _GoToPickupState();
}

class _GoToPickupState extends State<GoToPickup> {
  Result? currentTask; // data object of current ongoing task

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    currentTask = context.read<FindTaskProvider>().findTaskModel!.data!.result;
    setState(() {});
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'))
                ],
                content: Text(
                    'You have ${currentTask!.task!.schedules.length} items for pickup'),
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskType = currentTask?.task?.taskType;
    final address = currentTask?.task?.address;
    return WillPopScope(
      onWillPop: () async {
        await Future.delayed(Duration.zero, () {});
        return false;
      },
      child: Scaffold(
        appBar: CustomAppBar(),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Go to Pickup',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  12.h,
                  Text('${address!.firstName} ${address.lastName}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  6.h,
                  Text(
                    '#' + (currentTask?.task?.taskId).toString(),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: GREY5),
                  ),
                  // Wrap(
                  //     direction: Axis.horizontal,
                  //     children: List.generate(
                  //         currentTask!.task!.schedules.length,
                  //         (index) => CachedNetworkImage(
                  //             imageUrl:
                  //                 'https://static9.depositphotos.com/1669785/1150/i/600/depositphotos_11506024-stock-photo-package.jpg',
                  //             width: 125))),
                  CachedNetworkImage(
                      imageUrl:
                          'https://static9.depositphotos.com/1669785/1150/i/600/depositphotos_11506024-stock-photo-package.jpg',
                      width: 200),
                  20.h,
                  Text(
                    address.businessName ?? '',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  16.h,
                  Text(
                    'Flat, Floor, Building Name',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                  4.h,
                  Text(
                      '${address.street}, ${address.city}, ${address.state}, ${address.country}, ${address.pincode}',
                      style: TextStyle(fontSize: 16)),
                  16.h,
                  Text(
                    'Landmark',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                  4.h,
                  Text('${address.landmark}', style: TextStyle(fontSize: 16)),
                  16.h,
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    OutlinedButton.icon(
                      onPressed: () async {
                        await launch(
                            'tel:+91${currentTask!.task!.address!.phoneNumber}');
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
                        await launch(addressToDirectionURL(
                            '${address.street}, ${address.city}, ${address.state}, ${address.country}, ${address.pincode}'));
                      },
                      icon: Icon(Icons.navigation),
                      label: Text('Navigate',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(16)),
                    )
                  ]),
                  16.h,
                ],
              ),
            ),
            48.h,
          ],
        ),
        bottomNavigationBar: Container(
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
            thumb:
                Icon(Icons.double_arrow_rounded, color: Colors.green, size: 28),
            thumbPadding: EdgeInsets.all(5),
            child: Text(
              taskType == TaskType.pickup
                  ? "Arrived at pickup location"
                  : 'Arrived at drop location',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white),
            ),
            activeThumbColor: Colors.white,
            activeTrackColor: Colors.green,
            onSwipe: () async {
              UpdateDeliveryStatusModel? model;
              int sum = 0;
              for (var value in currentTask!.task!.schedules) {
                model = await context.read<FindTaskProvider>().updateStatus({
                  'delivery_id': value,
                  'status': 'reachedPickup',
                }, context);
                if (model?.status?.toLowerCase() == 'success') {
                  sum++;
                } else {
                  break;
                }
              }

              if (sum == currentTask!.task!.schedules.length) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ArrivedAtLocation()));
              }
            },
          ),
        ),
      ),
    );
  }
}
