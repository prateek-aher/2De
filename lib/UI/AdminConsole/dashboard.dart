import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Providers/Manager/dashboard_provider.dart';
import 'package:delivery/UI/AdminConsole/todays_tasks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_team.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<DashboardProvider>().refreshDashboard();
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            toolbarHeight: 80,
            leading: IconButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ProfileDetails()));
              },
              icon: ClipOval(
                child: Image.asset('assets/dummy_user.png'),
              ),
            ),
            title: Text('Welcome!'),
            centerTitle: false,
            elevation: 0,
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Start your search here',
                    filled: true,
                    hintStyle: TextStyle(color: Color(0xff979ea4)),
                    // fillColor: Color(0xfff4f3f8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    focusedBorder:
                        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 18, right: 18, top: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today\'s task',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    10.h,
                    GestureDetector(
                      onTap: () {
                        print('Today\'s task\n');
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => TodaysTasks()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(18),
                        height: 100,
                        decoration: BoxDecoration(
                            color: Color(0xfff4f3f8),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: Colors.transparent)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Consumer<DashboardProvider>(builder: (context, dashBoard, _) {
                                  return Text(
                                      dashBoard.pickups < 10
                                          ? '0${dashBoard.pickups}'
                                          : dashBoard.pickups.toString(),
                                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold));
                                }),
                                Text('Pick Up',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal))
                              ],
                            ),
                            Container(
                              color: Colors.grey[300],
                              width: 2,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Consumer<DashboardProvider>(builder: (context, dashBoard, _) {
                                  return Text(
                                      dashBoard.drops < 10
                                          ? '0${dashBoard.drops}'
                                          : dashBoard.drops.toString(),
                                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold));
                                }),
                                Text('Drops',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal))
                              ],
                            ),
                            Container(
                              color: Colors.grey[300],
                              width: 2,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Consumer<DashboardProvider>(builder: (context, dashBoard, _) {
                                  return Text(
                                      (dashBoard.pickups + dashBoard.drops) < 10
                                          ? '0${dashBoard.pickups + dashBoard.drops}'
                                          : (dashBoard.pickups + dashBoard.drops).toString(),
                                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold));
                                }),
                                Text('Total',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    20.h,
                    Text(
                      'My team',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    10.h,
                    GestureDetector(
                      onTap: () {
                        print('My team');
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => MyTeam()));
                      },
                      child: Container(
                        height: 170,
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Color(0xfff4f3f8),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bike Team',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                                10.h,
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      height: 80,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.green[100],
                                          borderRadius: BorderRadius.circular(12)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Consumer<DashboardProvider>(
                                              builder: (context, dashBoard, _) {
                                            return Text(
                                                '${dashBoard.bikeActive < 10 ? 0 : null}${dashBoard.bikeActive}',
                                                style: TextStyle(
                                                    fontSize: 28, fontWeight: FontWeight.bold));
                                          }),
                                          FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text('Active',
                                                style: TextStyle(
                                                    fontSize: 16, fontWeight: FontWeight.normal)),
                                          )
                                        ],
                                      ),
                                    ),
                                    10.w,
                                    Container(
                                        padding: EdgeInsets.symmetric(horizontal: 5),
                                        height: 80,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.red[200],
                                            borderRadius: BorderRadius.circular(12)),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Consumer<DashboardProvider>(
                                                builder: (context, dashBoard, _) {
                                              return Text(
                                                  '${dashBoard.bikeInactive < 10 ? 0 : null}${dashBoard.bikeInactive}',
                                                  style: TextStyle(
                                                      fontSize: 28, fontWeight: FontWeight.bold));
                                            }),
                                            FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text('Inactive',
                                                  style: TextStyle(
                                                      // fontSize: 16,
                                                      fontWeight: FontWeight.normal)),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.grey[300],
                              width: 2,
                              // height: 100,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Car Team',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                                10.h,
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.green[100],
                                          borderRadius: BorderRadius.circular(12)),
                                      height: 80,
                                      width: 60,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Consumer<DashboardProvider>(
                                              builder: (context, dashBoard, _) {
                                            return Text(
                                                '${dashBoard.carActive < 10 ? 0 : null}${dashBoard.carActive}',
                                                style: TextStyle(
                                                    fontSize: 28, fontWeight: FontWeight.bold));
                                          }),
                                          FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text('Active',
                                                style: TextStyle(
                                                    fontSize: 16, fontWeight: FontWeight.normal)),
                                          )
                                        ],
                                      ),
                                    ),
                                    10.w,
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red[200],
                                            borderRadius: BorderRadius.circular(12)),
                                        height: 80,
                                        width: 60,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Consumer<DashboardProvider>(
                                                builder: (context, dashBoard, _) {
                                              return Text(
                                                  '${dashBoard.carInactive < 10 ? 0 : null}${dashBoard.carInactive}',
                                                  style: TextStyle(
                                                      fontSize: 28, fontWeight: FontWeight.bold));
                                            }),
                                            FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text('Inactive',
                                                  style: TextStyle(
                                                      // fontSize: 16,
                                                      fontWeight: FontWeight.normal)),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.h,
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: () {}, child: Text('View History')))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<DashboardProvider>().refreshDashboard();
    });
  }
}
