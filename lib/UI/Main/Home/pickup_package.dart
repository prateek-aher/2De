import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/custom_appbar.dart';
import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Providers/FindTaskProvider.dart';
import 'package:delivery/Providers/TimeProvider.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:delivery/Utils/enumerations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../QRScanScreen.dart';
import 'cannot_accept_package.dart';
import 'no_show.dart';

// TODO: Add changes for hubPickup

class PickupPackage extends StatefulWidget {
  PickupPackage({Key? key, required this.package, required this.index}) : super(key: key);
  final Package package;
  final int index;
  @override
  State<PickupPackage> createState() => _PickupPackageState();
}

class _PickupPackageState extends State<PickupPackage> {
  Result? currentTask; // data object of current ongoing task

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      loadData();
    });
  }

  void loadData() {
    currentTask = context.read<TaskProvider>().findTaskModel!.data!.result;
    setState(() {});
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
          body: ListView(shrinkWrap: true, children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('Pickup package ${widget.index + 1} of ${currentTask?.packages.length}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CannotAcceptPackage()));
                      })
                ])),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('To:', style: TextStyle(fontSize: 16, color: Colors.grey)),
                  // 8.h,
                  Visibility(
                    visible: address?.firstName != null || address?.lastName != null,
                    child: Column(
                      children: [
                        Text('${address?.firstName} ${address?.lastName}',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                        8.h,
                      ],
                    ),
                  ),
                  Text('#${widget.package.orderId}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  12.h,
                  Image.network(
                      'https://static9.depositphotos.com/1669785/1150/i/600/depositphotos_11506024-stock-photo-package.jpg',
                      height: MediaQuery.of(context).size.height * 0.2),
                  12.h,
                  Text(
                    (currentTask?.task?.taskType == TaskType.hubPickup)
                        ? 'Hub'
                        : address?.businessName ?? '',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  20.h,
                  Text('Flat, Floor, Building Name',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black26)),
                  6.h,
                  Text(
                      [
                        address?.flatNumber,
                        address?.street,
                        address?.area,
                        address?.city,
                        // address?.state,
                        // address?.country,
                        currentTask?.task?.pincode ?? address?.pincode,
                      ].takeWhile((value) => value != null).join(', '),
                      // '${address?.flatNumber ?? ''}, ${address?.street??''}, ${address?.area ?? ''}, ${address?.city ?? ''}, ${address?.state ?? ''}, ${address?.country ?? ''}, ${address?.pincode ?? ''}',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  20.h,
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
                  )
                ],
              ),
            ),
            24.h,
          ]),
          bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: GREY7, offset: Offset(0, -4), blurRadius: 10, spreadRadius: 0)
                ],
              ),
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: ElevatedButton(
                  onPressed: () async {
                    bool isScanSuccessful = (await Navigator.of(context).push<bool>(
                          MaterialPageRoute(
                              builder: (context) => QRScanScreen(
                                    package: widget.package,
                                    taskType: taskType!,
                                  )),
                        )) ??
                        false;
                    if (isScanSuccessful) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Pick-up Now',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))))),
    );
  }
}
