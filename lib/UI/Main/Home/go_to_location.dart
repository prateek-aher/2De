import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/custom_appbar.dart';
import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Providers/FindTaskProvider.dart';
import 'package:delivery/UI/Main/Home/cannot_accept_package.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:delivery/Utils/enumerations.dart';
import 'package:delivery/Utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class GoToLocation extends StatefulWidget {
  const GoToLocation({Key? key}) : super(key: key);

  @override
  State<GoToLocation> createState() => _GoToLocationState();
}

class _GoToLocationState extends State<GoToLocation> {
  Result? currentTask; // data object of current ongoing task

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    currentTask = context.read<TaskProvider>().findTaskModel!.data!.result;
    setState(() {});
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
                titlePadding: const EdgeInsets.only(left: 36, right: 36, top: 36, bottom: 9),
                contentPadding: const EdgeInsets.only(left: 36, right: 36, bottom: 36, top: 9),
                title: Text(
                    'You have to ${(currentTask?.task?.taskType == TaskType.pickup) || (currentTask?.task?.taskType == TaskType.hubPickup) ? 'collect' : 'drop'} ${currentTask?.task?.schedules.length} package(s) ${currentTask?.task?.taskType == TaskType.pickup || currentTask?.task?.taskType == TaskType.hubPickup ? 'from' : 'at'} this ${currentTask?.task?.taskType == TaskType.pickup ? 'seller' : currentTask?.task?.taskType == TaskType.drop ? 'customer' : 'location'}',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center),
                content: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18)),
                    child: Text(
                      'I Understand',
                      style: TextStyle(fontSize: 16),
                    )),
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskType = currentTask?.task?.taskType;
    final address = currentTask?.task?.address;
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
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
                  Text(
                      taskType == TaskType.pickup
                          ? "Go to Pickup location"
                          : taskType == TaskType.drop
                              ? 'Go to Drop location'
                              : 'Go to Hub',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => CannotAcceptPackage()));
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
                  Visibility(
                    visible: address?.firstName != null && address?.lastName != null,
                    child: Column(
                      children: [
                        Text('${address?.firstName ?? ''} ${address?.lastName ?? ''}',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                        6.h,
                      ],
                    ),
                  ),
                  Text(
                    '${currentTask?.task?.schedules.length} item(s)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: GREY5),
                  ),
                  CachedNetworkImage(
                      imageUrl:
                          'https://static9.depositphotos.com/1669785/1150/i/600/depositphotos_11506024-stock-photo-package.jpg',
                      width: 200),
                  20.h,
                  Text(
                    (currentTask?.task?.taskType == TaskType.hubPickup ||
                            currentTask?.task?.taskType == TaskType.hubDrop)
                        ? 'Hub'
                        : address?.businessName ?? '',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  16.h,
                  Text(
                    'Flat, Floor, Building Name',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black45),
                  ),
                  4.h,
                  Text(
                      [
                        address?.flatNumber,
                        address?.street,
                        address?.area,
                        address?.city,
                        address?.state,
                        address?.country,
                        address?.pincode,
                      ].takeWhile((value) => value != null).join(', '),
                      // '${address?.flatNumber ?? ''}, ${address?.street??''}, ${address?.area ?? ''}, ${address?.city ?? ''}, ${address?.state ?? ''}, ${address?.country ?? ''}, ${address?.pincode ?? ''}',
                      style: TextStyle(fontSize: 16)),
                  16.h,
                  Visibility(
                    visible: address?.landmark != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Landmark',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black45),
                        ),
                        4.h,
                        Text('${address?.landmark}', style: TextStyle(fontSize: 16)),
                        16.h,
                      ],
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    OutlinedButton.icon(
                      onPressed: currentTask?.task?.address?.phoneNumber == null
                          ? null
                          : () async {
                              await launch('tel:+91${currentTask?.task?.address?.phoneNumber}');
                            },
                      icon: Icon(Icons.call),
                      label: Text(
                        'Call',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          side: BorderSide(
                              color: currentTask?.task?.address?.phoneNumber == null
                                  ? Colors.grey
                                  : Theme.of(context).primaryColor)),
                    ),
                    12.w,
                    OutlinedButton.icon(
                      onPressed: (currentTask?.task?.latitude == null ||
                              currentTask?.task?.longitude == null)
                          ? null
                          : () async {
                              print(
                                  'location is ${currentTask?.task?.latitude}, ${currentTask?.task?.longitude}');
                              await launch(addressToDirectionURL(
                                  latitude: (currentTask?.task?.latitude ?? '').toString(),
                                  longitude: (currentTask?.task?.longitude ?? '').toString()));
                            },
                      icon: Icon(Icons.navigation),
                      label: Text('Navigate',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                      style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          side: BorderSide(
                              color: (currentTask?.task?.latitude == null ||
                                      currentTask?.task?.longitude == null)
                                  ? Colors.grey
                                  : Theme.of(context).primaryColor)),
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
            BoxShadow(color: GREY7, offset: Offset(0, -4), blurRadius: 10, spreadRadius: 0)
          ]),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: SwipeButton.expand(
            height: 68,
            thumb: Icon(Icons.double_arrow_rounded, color: Colors.green, size: 28),
            thumbPadding: EdgeInsets.all(8),
            child: Text(
              'Arrived at Location',
              // taskType == TaskType.pickup || taskType == TaskType.hubPickup
              //     ? "Arrived at Pickup location"
              //     : 'Arrived at Drop location',
              style: TextStyle(
                  overflow: TextOverflow.visible,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white),
            ),
            activeThumbColor: Colors.white,
            activeTrackColor: Colors.green,
            onSwipe: () async {
              await context.read<TaskProvider>().reachedLocation(context);
            },
          ),
        ),
      ),
    );
  }
}
