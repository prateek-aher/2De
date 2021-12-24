import 'dart:convert';

import 'package:delivery/Animation/avatar_glow.dart';
import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Providers/FindTaskProvider.dart';
import 'package:delivery/Providers/UpdateStatusProvider.dart';
import 'package:delivery/UI/Main/QRScanSreen.dart';
import 'package:delivery/Utils/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class FindingTask extends StatefulWidget {
  const FindingTask({Key? key}) : super(key: key);

  @override
  _FindingTaskState createState() => _FindingTaskState();
}

class _FindingTaskState extends State<FindingTask> {
  @override
  void initState() {
    context.read<FindTaskProvider>().findTask(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final taskData = context.watch<FindTaskProvider>();
    return Scaffold(
      body: Material(
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Consumer<FindTaskProvider>(
              builder: (context, findTask, _) {
                return findTask.postResponse
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: "findingTask",
                            child: AvatarGlow(
                              endRadius: 200,
                              glowColor: Primary_Color,
                              child: Container(
                                height: 180,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Primary_Color),
                                child: Center(
                                  child: Text(
                                    'Finding Task',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          sbh(20),
                          OutlinedButton(
                              onPressed: () {
                                context.read<FindTaskProvider>().changeWidget();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Stop Search",
                                  style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .fontSize),
                                ),
                              ))
                        ],
                      )
                    :
                    // Got Response Container
                    Column(
                        children: [
                          taskData.findTaskData!.message ==
                                  "You have successfully Got Delivery"
                              ? Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 30, 10, 0),
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 8)
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          findTask.findTaskData!.data!.result!
                                                      .task!.taskType ==
                                                  "pickup"
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0, top: 5),
                                                  child: Text(
                                                    "PickUp Address",
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                )
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, top: 5),
                                                  child: Text(
                                                    "Drop Address",
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: 10,
                                              top: 5,
                                            ),
                                            child: IconButton(
                                                onPressed: () {
                                                  // Navigator.pop(context);
                                                  context
                                                      .read<FindTaskProvider>()
                                                      .reSet();
                                                },
                                                icon: Image.asset(
                                                    "assets/close.png")),
                                          )
                                        ],
                                      ),
                                      Text(
                                        findTask.findTaskData!.data!.result!
                                                .task!.address!.firstname
                                                .toString() +
                                            "\t" +
                                            findTask.findTaskData!.data!.result!
                                                .task!.address!.lastname
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Flat, Floor, Building Name',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        findTask.findTaskData!.data!.result!
                                            .task!.address!.street
                                            .toString(),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        findTask.findTaskData!.data!.result!
                                            .task!.address!.area
                                            .toString(),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Landmark',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        findTask.findTaskData!.data!.result!
                                            .task!.address!.landmark
                                            .toString(),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ButtonBar(
                                        alignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          OutlinedButton(
                                              onPressed: () {
                                                UrlLauncher.launch(
                                                    "tel:${findTask.findTaskData!.data!.result!.task!.address!.phoneNo}");
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 25,
                                                    child: Image.asset(
                                                        "assets/call.png"),
                                                  ),
                                                  Text("Call")
                                                ],
                                              )),
                                          OutlinedButton(
                                              onPressed: () {},
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 25,
                                                    child: Image.asset(
                                                        "assets/navigation.png"),
                                                  ),
                                                  Text("Navigate")
                                                ],
                                              ))
                                        ],
                                      ),
                                      Consumer<UpdateStatusProvider>(
                                        builder: (context, updateStatus, _) {
                                          return updateStatus.getStatus == null
                                              ? SwipeButton(
                                                  onSwipe: () {
                                                    String requestJson =
                                                        json.encode({
                                                      "delivery_id":
                                                          "${findTask.findTaskData!.data!.result!.packages![0].deliveryId}",
                                                      "status": findTask
                                                                  .findTaskData!
                                                                  .data!
                                                                  .result!
                                                                  .task!
                                                                  .taskType ==
                                                              "pickup"
                                                          ? "reachedDrop"
                                                          : "reachedPickup"
                                                    });
                                                    context
                                                        .read<
                                                            UpdateStatusProvider>()
                                                        .updateStatus(
                                                            requestJson);
                                                  },
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  activeTrackColor: Colors
                                                      .greenAccent.shade100,
                                                  thumbPadding:
                                                      EdgeInsets.all(5),
                                                  activeThumbColor:
                                                      Colors.white,
                                                  thumb: Icon(Icons
                                                      .arrow_forward_rounded),
                                                  elevation: 2,
                                                  child: Text(
                                                      "Swipe right to arrive At Hub."),
                                                )
                                              : ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                QrScanScreen()));
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text("Scan and Photo")
                                                    ],
                                                  ));
                                        },
                                      )
                                    ],
                                  ),
                                )
                              : Center(
                                  child: Text(taskData.findTaskData!.message
                                      .toString()),
                                )
                        ],
                      );
              },
            )),
      ),
    );
  }
}
