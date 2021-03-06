import 'package:delivery/Animation/avatar_glow.dart';
import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/CustomSnackBar.dart';
import 'package:delivery/CommonWidget/custom_appbar.dart';
import 'package:delivery/Providers/BagProvider.dart';
import 'package:delivery/Providers/FindTaskProvider.dart';
import 'package:delivery/Providers/TimeProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? url;
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<TimeProvider>().updateTime();
      context.read<BagProvider>().getMyBag(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime previousBackPressTime = DateTime.now();
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (now.difference(previousBackPressTime) < Duration(seconds: 3)) {
          return true;
        } else {
          previousBackPressTime = now;
          showCustomSnackBar(context, Text('Press again to exit'));
          return false;
        }
      },
      child: Scaffold(
          appBar: CustomAppBar(),
          body: Consumer<TaskProvider>(
            builder: (context, findTask, _) {
              return findTask.gotResponse ? findingTaskWidget() : idleWidget();
            },
          )),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget idleWidget() {
    return Column(children: [
      // My Bag
      Expanded(
          flex: 4,
          child: Consumer<BagProvider>(
              builder: (context, bag, child) => Visibility(
                  visible: bag.items.isNotEmpty,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    (MediaQuery.of(context).size.height * 0.07).h,
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        8.w,
                        Text(
                          'My Bag',
                          style: TextStyle(
                            fontSize: 26,
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '${bag.items.length} Items',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        8.w
                      ],
                    ),
                    12.h,
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: bag.items
                                .map((e) => Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.grey),
                                                  borderRadius: BorderRadius.circular(12),
                                                  image: DecorationImage(
                                                      image: NetworkImage(e.pickupImages.first),
                                                      fit: BoxFit.cover)),
                                              height: 100,
                                              width: 100),
                                          Text(e.productType ?? '', style: TextStyle(fontSize: 16)),
                                          Text('#${e.projectId}'),
                                        ])))
                                .toList()))
                  ])))),
      Text(
        DateFormat('d MMMM y').format(DateTime.now()),
        style: TextStyle(fontSize: 16),
      ),
      10.h,
      Consumer<TimeProvider>(
          builder: (context, timer, child) => Text(
                timer.currentTime,
                style: TextStyle(fontSize: 30),
              )),
      Spacer(),
      // Button
      Container(
          margin: const EdgeInsets.all(10),
          height: 150,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    color: Theme.of(context).primaryColor.withOpacity(0.7),
                    blurRadius: 20,
                    spreadRadius: 3)
              ]),
          child: ElevatedButton(
              onPressed: () => context.read<TaskProvider>().findTask(context),
              style: ElevatedButton.styleFrom(shape: CircleBorder(), elevation: 10),
              child: Center(
                  child: Text('Start', style: TextStyle(color: Colors.white, fontSize: 30))))),
      Spacer(),
      Text('Click on Start To Get Task'),
      48.h,
    ]);
  }

  Widget findingTaskWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AvatarGlow(
            endRadius: 200,
            glowColor: Theme.of(context).primaryColor,
            child: Container(
              height: 180,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
              child: Center(
                child: Text(
                  'Finding Task',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
          20.h,
          OutlinedButton(
              onPressed: () {
                context.read<TaskProvider>().changeWidget();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Stop Search",
                  style: TextStyle(fontSize: Theme.of(context).textTheme.subtitle1!.fontSize),
                ),
              ))
        ],
      ),
    );
  }
}
