import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Providers/Manager/dashboard_provider.dart';
import 'package:delivery/UI/Admin/delivery_list.dart';
import 'package:delivery/UI/Admin/profile.dart';
import 'package:delivery/UI/Admin/todays_tasks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/constants/endpoints.dart';
import '../../Utils/constants/strings.dart';
import 'my_team.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? avatarUrl;

  loadAvatar() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    avatarUrl = _pref.getString('avatar');
    setState(() {});
  }

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
              },
              icon: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: (avatarUrl?.contains('no-image') ?? true)
                      ? DUMMY_USER_AVATAR_URL
                      : BASE_URL + (avatarUrl ?? '/'),
                  errorWidget: (_, __, ___) => Image.asset('assets/dummy_user.png'),
                ),
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
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold));
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
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold));
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
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold));
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Bike Team',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
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
                                                    color: Colors.black54,
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.bold));
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
                                                      color: Colors.black54,
                                                      fontSize: 28,
                                                      fontWeight: FontWeight.bold));
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Car Team',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
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
                                                    color: Colors.black54,
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.bold));
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
                                                      color: Colors.black54,
                                                      fontSize: 28,
                                                      fontWeight: FontWeight.bold));
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
                    divider(),
                    10.h,
                    InkWell(
                      onTap: () {
                        print('Delivered');
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => DeliveryList()));
                      },
                      child: Container(
                        height: 70,
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Color(0xfff4f3f8),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text('Delivered(<10>)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54)),
                            ),
                            Container(
                              color: Colors.grey[300],
                              width: 2,
                            ),
                            Expanded(
                              child: Text('Returned(<02>)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54)),
                            ),
                          ],
                        ),
                      ),
                    ),
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
      loadAvatar();
    });
  }
}
