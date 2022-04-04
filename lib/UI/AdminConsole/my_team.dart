import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:flutter/material.dart';

class MyTeam extends StatelessWidget {
  const MyTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Team'),
          centerTitle: false,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              decoration: BoxDecoration(
                  color: Color(0xfff4f3f8),
                  borderRadius: BorderRadius.circular(12)),
              child: TabBar(
                  padding: EdgeInsets.all(8),
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 3),
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2)
                      ]),
                  tabs: [
                    Tab(
                      text: 'BIKE TEAM',
                    ),
                    Tab(
                      text: 'CAR TEAM',
                    )
                  ]),
            ),
            12.h,
            Expanded(
                child: TabBarView(children: [
              ListView(
                shrinkWrap: true,
                children: [
                  DeliveryBoyTile(
                    name: 'Rajshekhar',
                    area: 'Hadapsar area',
                  ),
                  6.h,
                  DeliveryBoyTile(
                    name: 'Dhananjay',
                    area: 'Yerwada area',
                  ),
                  6.h,
                  DeliveryBoyTile(
                    name: 'Amrit',
                    area: 'Bhosari area',
                  ),
                  6.h,
                  DeliveryBoyTile(
                    name: 'Vishal',
                    area: 'Hinjewadi area',
                  ),
                  6.h,
                  DeliveryBoyTile(
                    name: 'Akshay',
                    area: 'Pimpri area',
                  ),
                  6.h,
                  DeliveryBoyTile(
                    name: 'Aawhan',
                    area: 'Chinchwad area',
                  ),
                ],
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  DeliveryBoyTile(
                    name: 'Rajshekhar',
                    area: 'Hadapsar area',
                  ),
                  6.h,
                  DeliveryBoyTile(
                    name: 'Dhananjay',
                    area: 'Yerwada area',
                  ),
                  6.h,
                  DeliveryBoyTile(
                    name: 'Amrit',
                    area: 'Bhosari area',
                  ),
                  6.h,
                  DeliveryBoyTile(
                    name: 'Vishal',
                    area: 'Hinjewadi area',
                  ),
                  6.h,
                  DeliveryBoyTile(
                    name: 'Akshay',
                    area: 'Pimpri area',
                  ),
                  6.h,
                  DeliveryBoyTile(
                    name: 'Aawhan',
                    area: 'Chinchwad area',
                  ),
                ],
              )
            ]))
          ],
        ),
      ),
    );
  }
}

class DeliveryBoyTile extends StatelessWidget {
  const DeliveryBoyTile({Key? key, required this.name, required this.area})
      : super(key: key);
  final String name;
  final String area;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: Image.asset('assets/dummy_user.png'),
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            area,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          )
        ],
      ),
      trailing: Switch(value: true, onChanged: (value) {}),
    );
  }
}
