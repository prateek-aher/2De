import 'package:delivery/Animation/avatar_glow.dart';
import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/Snackbar.dart';
import 'package:delivery/Providers/FindTaskProvider.dart';
import 'package:delivery/Providers/TimeProvider.dart';
import 'package:delivery/Providers/BagProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    context.read<BagProvider>().getMyBag(context);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<TimeProvider>().updateTime();
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
          appBar: customAppBar(context),
          body: Consumer<FindTaskProvider>(
            builder: (context, findTask, _) {
              return findTask.gotResponse ? findingTaskWidget() : idleWidget();
            },
          )),
    );
  }

  @override
  void didChangeDependencies() {
    context.read<BagProvider>().getMyBag(context);
    super.didChangeDependencies();
  }

  Widget idleWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Consumer<BagProvider>(
                builder: (context, bag, child) => Visibility(
                      visible: bag.items.isNotEmpty,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          sbh(MediaQuery.of(context).size.height * 0.07),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              sbw(8),
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
                              sbw(8)
                            ],
                          ),
                          sbh(12),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: bag.items
                                  .map((e) => Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 2),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          e['url']),
                                                      fit: BoxFit.cover)),
                                              height: 100,
                                              width: 100,
                                            ),
                                            Text(
                                              e['name'],
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text('#${e['id']}'),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    )),
          ),
          Text(
            DateFormat('d MMMM y').format(DateTime.now()),
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Consumer<TimeProvider>(
              builder: (context, timer, child) => Text(
                    timer.currentTime,
                    style: TextStyle(fontSize: 30),
                  )),
          Spacer(),
          Container(
            margin: const EdgeInsets.all(10),
            height: 150,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 4)
                ]),
            child: ElevatedButton(
              onPressed: () {
                context.read<FindTaskProvider>().changeWidget();
                context.read<FindTaskProvider>().findTask(context);
              },
              style: ElevatedButton.styleFrom(shape: CircleBorder()),
              child: Center(
                child: Text(
                  'Start',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      backgroundColor: Colors.transparent),
                ),
              ),
            ),
          ),
          Text('Click on Start To Get Task'),
          Spacer(flex: 2)
        ],
      ),
    );
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
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor),
              child: Center(
                child: Text(
                  'Finding Task',
                  style: TextStyle(color: Colors.white, fontSize: 25),
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
                      fontSize:
                          Theme.of(context).textTheme.subtitle1!.fontSize),
                ),
              ))
        ],
      ),
    );
  }
}
