import 'package:delivery/Animation/avatar_glow.dart';
import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/Snackbar.dart';
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
  @override
  void initState() {
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
          CustomSnackBar(context, Text('Press again to exit'));
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

  Widget idleWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 4),
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
          Hero(
            tag: 'findingTask',
            child: Container(
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
          Hero(
            tag: "findingTask",
            child: AvatarGlow(
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
