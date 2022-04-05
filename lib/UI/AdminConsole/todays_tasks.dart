import 'package:delivery/Providers/Manager/tasklist_provider.dart';
import 'package:delivery/Providers/Manager/team_list_provider.dart';
import 'package:delivery/UI/AdminConsole/pickup_task_details.dart';
import 'package:flutter/material.dart';
import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:provider/provider.dart';

import '../../Models/task_list_model.dart';
import 'drop_task_details.dart';
import 'my_team.dart';

class TodaysTasks extends StatefulWidget {
  const TodaysTasks({Key? key}) : super(key: key);

  @override
  State<TodaysTasks> createState() => _TodaysTasksState();
}

class _TodaysTasksState extends State<TodaysTasks> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Today\'s task'),
          centerTitle: false,
          actions: [
            VerticalDivider(color: Colors.white),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyTeam()));
                },
                child: Text(
                  'My Team',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: Consumer<TaskListProvider>(
          builder: (context, taskList, _) => Column(
            children: [
              // search
              // TODO: Implement search here
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

              // tab bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                decoration: BoxDecoration(
                    color: Color(0xfff4f3f8), borderRadius: BorderRadius.circular(12)),
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
                        text: 'PICK UP (${taskList.pickupList.length})',
                      ),
                      Tab(
                        text: 'DROP (${taskList.dropList.length})',
                      )
                    ]),
              ),
              12.h,
              Expanded(
                child: TabBarView(children: [
                  RefreshIndicator(
                    displacement: 20,
                    onRefresh: () async {
                      await context.read<TaskListProvider>().refreshTaskList();
                    },
                    child: ListView(
                      shrinkWrap: true,
                      children: List.generate(
                          taskList.pickupList.length,
                          (index) => PickupBubble(
                                pickup: taskList.pickupList[index],
                              )),
                    ),
                  ),
                  RefreshIndicator(
                    displacement: 20,
                    onRefresh: () async {
                      await context.read<TaskListProvider>().refreshTaskList();
                    },
                    child: ListView(
                      shrinkWrap: true,
                      children: List.generate(
                          taskList.dropList.length,
                          (index) => DropBubble(
                                drop: taskList.dropList[index],
                              )),
                    ),
                  ),
                ]),
              )
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
      context.read<TaskListProvider>().refreshTaskList();
      if (context.read<TeamListProvider>().listAll.isEmpty) {
        context.read<TeamListProvider>().getTeamList();
      }
    });
  }
}

class PickupBubble extends StatelessWidget {
  PickupBubble({Key? key, required this.pickup}) : super(key: key);
  final Pickup pickup;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PickupTaskDetails(
                  taskId: pickup.taskId!,
                )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        padding: const EdgeInsets.all(12),
        // height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfff4f3f8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(pickup.creatorName,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                Spacer(),
                Icon(
                  Icons.access_time_rounded,
                  color: Colors.black,
                  size: 12,
                ),
                Text(
                  ' ----',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                )
              ],
            ),
            6.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // TODO: Ask short address to be given here
                  '',
                  // (pickup.address?.landmark ?? '') + ', ' + (pickup.address?.area ?? ''),
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                ),
                Spacer(),
                Text(
                  pickup.status ?? '---',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                )
              ],
            ),
            6.h,
            divider(),
            // 6.h,
            Row(
              children: [
                Text(
                  pickup.team?.name ?? '----',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                5.w,
                TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              Consumer<TeamListProvider>(builder: (context, listProvider, _) {
                                return ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => RadioListTile(
                                        value: false,
                                        groupValue: true,
                                        onChanged: (value) {},
                                        title: Text(listProvider.listAll[index].name ?? '')),
                                    separatorBuilder: (_, __) => 12.h,
                                    itemCount: listProvider.listAllActive.length);
                              }));
                    },
                    child: Text(
                      'Change',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    )),
                Spacer(),
                Text(
                  '${pickup.schedules.length} items',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DropBubble extends StatelessWidget {
  const DropBubble({Key? key, required this.drop}) : super(key: key);
  final Drop drop;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DropTaskDetails(
                  taskId: drop.taskId!,
                )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        padding: const EdgeInsets.all(12),
        // height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfff4f3f8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Viraj Patil',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Spacer(),
                Icon(
                  Icons.access_time_rounded,
                  color: Colors.black,
                  size: 12,
                ),
                Text(
                  '12 hrs',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                )
              ],
            ),
            6.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shiv Malhar Colony, Hadapsar, Pune',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                ),
                Spacer(),
                Text(
                  'Picked up',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                )
              ],
            ),
            6.h,
            divider(),
            // 6.h,
            Row(
              children: [
                Text(
                  'Rajshekhar',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                5.w,
                TextButton(onPressed: () {}, child: Text('Change')),
                Spacer(),
                Text(
                  '02 items',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
