import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Providers/Manager/team_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyTeam extends StatefulWidget {
  const MyTeam({Key? key}) : super(key: key);

  @override
  State<MyTeam> createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> {
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
              decoration:
                  BoxDecoration(color: Color(0xfff4f3f8), borderRadius: BorderRadius.circular(12)),
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
              Consumer<TeamListProvider>(builder: (context, listProvider, _) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: listProvider.listBikes.length,
                  separatorBuilder: (BuildContext context, int index) => 22.h,
                  itemBuilder: (BuildContext context, int index) => DeliveryBoyTile(
                    name: listProvider.listBikes[index].name ?? '',
                    // area: listProvider.listBikes[index].area??'',
                  ),
                );
              }),
              Consumer<TeamListProvider>(builder: (context, listProvider, _) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: listProvider.listCars.length,
                  separatorBuilder: (BuildContext context, int index) => 22.h,
                  itemBuilder: (BuildContext context, int index) => DeliveryBoyTile(
                    name: listProvider.listCars[index].name ?? '',
                    // area: listProvider.listCars[index].area??'',
                  ),
                );
              })
            ]))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<TeamListProvider>().getTeamList();
    });
  }
}

class DeliveryBoyTile extends StatelessWidget {
  const DeliveryBoyTile({Key? key, required this.name, this.area}) : super(key: key);
  final String name;
  final String? area;
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
            area ?? '',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          )
        ],
      ),
      trailing: Switch(value: true, onChanged: (value) {}),
    );
  }
}
