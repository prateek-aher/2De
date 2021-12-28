import 'dart:async';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Providers/TimeProvider.dart';
import 'package:delivery/UI/Main/QRScanScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArrivedAtLocation extends StatefulWidget {
  const ArrivedAtLocation({Key? key, required this.address, required this.task})
      : super(key: key);
  final Address address;
  final Task task;

  @override
  State<ArrivedAtLocation> createState() => _ArrivedAtLocationState();
}

class _ArrivedAtLocationState extends State<ArrivedAtLocation> {
  int sec = 10 * 60;
  @override
  void initState() {
    if (widget.task == Task.drop) {
      context.read<TimeProvider>().start10minuteTimer();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: ListView(
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.task == Task.pickup
                      ? 'Pickup package'
                      : 'Drop package',
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
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                sbh(8),
                Text(
                  '${widget.address.firstname} ${widget.address.lastname}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                sbh(6),
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
                Text(
                  widget.address.businessName ?? '',
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
                  '${widget.address.street}, ${widget.address.city}, ${widget.address.state}, ${widget.address.country}, ${widget.address.pinCode}',
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
                  '${widget.address.landmark}',
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
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: widget.task == Task.pickup
            ? ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => QRScanScreen()));
                },
                child: Text(
                  'Scan and Photo',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Consumer<TimeProvider>(
                        builder: (context, timer, child) {
                      return Text(
                        'Waiting: ${(timer.seconds / 60).floor()} :${timer.seconds.remainder(60)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color:
                              timer.seconds < 180 ? Colors.red : Colors.black,
                        ),
                      );
                    }),
                  ),
                  sbw(12),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16)),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => QRScanScreen()));
                        },
                        child: Text(
                          "Drop Now",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                ],
              ),
      ),
    );
  }
}