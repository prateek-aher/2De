import 'package:delivery/CommonWidget/Snackbar.dart';
import 'package:delivery/Providers/Manager/tasklist_provider.dart';
import 'package:delivery/Providers/Manager/team_list_provider.dart';
import 'package:delivery/UI/Admin/pickup_task_details.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      loadData();
    });
  }

  loadData() async {
    await context.read<TaskListProvider>().refreshTaskList();
    if (context.read<TeamListProvider>().listAll.isEmpty) {
      await context.read<TeamListProvider>().getTeamList();
    }
  }

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
                Flexible(
                  child: Text(pickup.creatorName,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.black,
                      size: 12,
                    ),
                    Text(
                      ' ----',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
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
                  style: TextStyle(
                      color: pickup.status == 'completed'
                          ? Colors.green
                          : pickup.status == 'unassigned'
                              ? Colors.red
                              : Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
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
                    onPressed: () async {
                      if (context.read<TeamListProvider>().listAllActive.isNotEmpty) {
                        await showModalBottomSheet(
                            constraints:
                                BoxConstraints(maxWidth: 0.9 * MediaQuery.of(context).size.width),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(18), topRight: Radius.circular(18))),
                            context: context,
                            builder: (context) =>
                                Consumer<TeamListProvider>(builder: (context, listProvider, _) {
                                  return ListView.separated(
                                      padding: EdgeInsets.all(18),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) => InkWell(
                                            onTap: () async {
                                              await context.read<TaskListProvider>().taskReassign(
                                                  taskId: pickup.taskId.toString(),
                                                  teamId: listProvider.listAll[index].teamId
                                                      .toString());
                                              Navigator.pop(context);
                                            },
                                            child: Row(
                                              children: [
                                                Radio(
                                                  value: false,
                                                  groupValue: pickup.team?.teamId !=
                                                      listProvider.listAllActive[index].teamId,
                                                  onChanged: (_) {},
                                                ),
                                                5.w,
                                                Text(
                                                  listProvider.listAllActive[index].name ?? '',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500, fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                      separatorBuilder: (_, __) => 2.h,
                                      itemCount: listProvider.listAllActive.length);
                                }));
                      } else {
                        await showCustomSnackBar(context, Text('No delivery partners available'));
                      }
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
  DropBubble({Key? key, required this.drop}) : super(key: key);
  final Drop drop;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DropTaskDetails(drop: drop)));
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
                Flexible(
                  child: Text(drop.customerName,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.black,
                      size: 12,
                    ),
                    Text(
                      ' ----',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
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
                  drop.status ?? '---',
                  style: TextStyle(
                      color: drop.status == 'completed'
                          ? Colors.green
                          : drop.status == 'unassigned'
                              ? Colors.red
                              : Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            6.h,
            divider(),
            // 6.h,
            Row(
              children: [
                Text(
                  drop.team?.name ?? '----',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                5.w,
                TextButton(
                    onPressed: () async {
                      if (context.read<TeamListProvider>().listAllActive.isNotEmpty) {
                        await showModalBottomSheet(
                            constraints:
                                BoxConstraints(maxWidth: 0.9 * MediaQuery.of(context).size.width),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(18), topRight: Radius.circular(18))),
                            context: context,
                            builder: (context) =>
                                Consumer<TeamListProvider>(builder: (context, listProvider, _) {
                                  return ListView.separated(
                                      padding: EdgeInsets.all(18),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) => InkWell(
                                            onTap: () async {
                                              await context.read<TaskListProvider>().taskReassign(
                                                  taskId: drop.taskId.toString(),
                                                  teamId: listProvider.listAll[index].teamId
                                                      .toString());
                                              Navigator.pop(context);
                                            },
                                            child: Row(
                                              children: [
                                                Radio(
                                                  value: false,
                                                  groupValue: drop.team?.teamId !=
                                                      listProvider.listAllActive[index].teamId,
                                                  onChanged: (_) {},
                                                ),
                                                5.w,
                                                Text(
                                                  listProvider.listAllActive[index].name ?? '',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500, fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                      separatorBuilder: (_, __) => 2.h,
                                      itemCount: listProvider.listAllActive.length);
                                }));
                      } else {
                        await showCustomSnackBar(context, Text('No delivery partners available'));
                      }
                    },
                    child: Text(
                      'Change',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    )),
                Spacer(),
                Text(
                  '${drop.schedules.length} items',
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
