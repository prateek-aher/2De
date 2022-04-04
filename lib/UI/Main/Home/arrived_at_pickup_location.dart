import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/custom_appbar.dart';
import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Providers/FindTaskProvider.dart';
import 'package:delivery/Providers/TimeProvider.dart';
import 'package:delivery/UI/Main/Home/scanned_items.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:delivery/Utils/enumerations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cannot_accept_package.dart';
import 'no_show.dart';

class ArrivedAtPickupLocation extends StatefulWidget {
  ArrivedAtPickupLocation({Key? key}) : super(key: key);

  @override
  State<ArrivedAtPickupLocation> createState() =>
      _ArrivedAtPickupLocationState();
}

class _ArrivedAtPickupLocationState extends State<ArrivedAtPickupLocation> {
  Result? currentTask; // data object of current ongoing task

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    currentTask = context.read<FindTaskProvider>().findTaskModel!.data!.result;
    if (currentTask!.task!.taskType == TaskType.pickup ||
        currentTask!.task!.taskType == TaskType.drop) {
      context.read<TimeProvider>().startTimer(Duration(minutes: 10));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final taskType = currentTask?.task?.taskType;
    final address = currentTask?.task?.address;
    return Scaffold(
        appBar: CustomAppBar(),
        body: ListView(shrinkWrap: true, children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        taskType == TaskType.pickup ||
                                taskType == TaskType.hubPickup
                            ? 'Pickup package(s)'
                            : 'Drop package(s)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CannotAcceptPackage()));
                        })
                  ])),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('To:', style: TextStyle(fontSize: 16, color: Colors.grey)),
                8.h,
                Text('${address?.firstName} ${address?.lastName}',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                6.h,
                Text(
                    '#' +
                        context
                            .read<FindTaskProvider>()
                            .findTaskModel!
                            .data!
                            .result!
                            .task!
                            .taskId
                            .toString(),
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Text(address?.businessName ?? '',
                    style: TextStyle(fontSize: 18)),
                12.h,
                Text('Flat, Floor, Building Name',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45)),
                6.h,
                Text(
                    '${address?.street}, ${address?.city}, ${address?.state}, ${address?.country}, ${address?.pincode}',
                    style: TextStyle(fontSize: 16)),
                12.h,
                Text('Landmark',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45)),
                6.h,
                Text('${address?.landmark}', style: TextStyle(fontSize: 16)),
                12.h,
                Image.network(
                    'https://static9.depositphotos.com/1669785/1150/i/600/depositphotos_11506024-stock-photo-package.jpg',
                    height: MediaQuery.of(context).size.height * 0.2),
                12.h,
              ],
            ),
          ),
          48.h,
        ]),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: GREY7,
                  offset: Offset(0, -4),
                  blurRadius: 10,
                  spreadRadius: 0)
            ]),
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: taskType == TaskType.pickup || taskType == TaskType.hubPickup
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ScannedItems()));
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => QRScanScreen()));
                    },
                    child: Text('Scan and Photo',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)))
                : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(child: Consumer<TimeProvider>(
                        builder: (context, timer, child) {
                      return timer.timerRunning
                          ? Text(
                              'Waiting: ${(timer.seconds / 60).floor()} :${timer.seconds.remainder(60)}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: timer.seconds < 180
                                    ? Colors.red
                                    : Colors.black,
                              ))
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16)),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => NoShow()));
                              },
                              child: Text("No Show",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  )));
                    })),
                    12.w,
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16)),
                            onPressed: () {
                              // TODO: Drop procedure
                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(
                              //         builder: (context) => QRScanScreen()));
                            },
                            child: Text("Drop Now",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500))))
                  ])));
  }
}
