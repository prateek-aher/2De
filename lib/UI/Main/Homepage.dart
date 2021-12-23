import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Providers/FindTaskProvider.dart';
import 'package:delivery/Providers/SosProvider.dart';
import 'package:delivery/UI/Auth/NewAccount/enter_name.dart';
import 'package:delivery/UI/Auth/NewAccount/successfully_registerd.dart';
import 'package:delivery/UI/Main/FindingTask.dart';
import 'package:delivery/UI/Main/PassBook.dart';
import 'package:delivery/UI/Main/ProfileDetails.dart';
import 'package:provider/provider.dart';
import 'package:delivery/Providers/TimeProvider.dart';
import 'package:delivery/Utils/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'home/help.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<TimeProvider>().updateTimer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(left: 20, bottom: 4),
            title: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileDetails()));
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/dummy_user.png'),
                radius: 20,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          backgroundColor: Primary_Color,
          centerTitle: true,
          title: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Passbook()));
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 24))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                              create: (BuildContext context) => SosProvider(),
                              child: Help())));
                },
                child: Text(
                  "Help!",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
            // Text('     ')
          ],
        ),
        body: Consumer<FindTaskProvider>(
          builder: (context, findTask, _) {
            return findTask.gotResponse ? FindingTask() : firstWidget();
          },
        ));
  }

  Widget firstWidget() {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 4),
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Consumer<TimeProvider>(
                builder: (context, timer, child) => Text(
                      timer.currentTime,
                      style: TextStyle(fontSize: 30),
                    )),
            Spacer(),
            InkWell(
              onTap: () {
                context.read<FindTaskProvider>().changeWidget();
              },
              child: Hero(
                tag: "findingTask",
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Primary_Color),
                  child: Center(
                    child: Text(
                      'Start',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
            sbh(10),
            Text('Click on Start To Get Task'),
            Spacer(flex: 2)
          ],
        ),
      ),
    );
  }
}
