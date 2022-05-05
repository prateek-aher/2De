import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Models/task_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Models/TaskDetailsModel.dart';
import '../../Providers/Manager/task_details_provider.dart';
import '../../Providers/Manager/tasklist_provider.dart';
import '../../Providers/Manager/team_list_provider.dart';
import 'my_team.dart';

class DropTaskDetails extends StatefulWidget {
  const DropTaskDetails({Key? key, required this.drop}) : super(key: key);

  final Drop drop;

  @override
  State<DropTaskDetails> createState() => _DropTaskDetailsState();
}

class _DropTaskDetailsState extends State<DropTaskDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<TaskDetailsProvider>().getTaskDetails(taskId: widget.drop.taskId.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop task details'),
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
      body: RefreshIndicator(
        displacement: 20,
        onRefresh: () async {
          await context
              .read<TaskDetailsProvider>()
              .getTaskDetails(taskId: widget.drop.taskId.toString());
        },
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(18),
          children: [
            Text(
              'Drop to',
              style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(12),
              // height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xfff4f3f8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Consumer<TaskDetailsProvider>(
                              builder: (context, provider, _) => Text(
                                    provider.taskDetails.data?.result?.task?.customerName ?? '',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                  ))),
                      Consumer<TaskDetailsProvider>(
                          builder: (context, provider, _) => Text(
                                '${provider.taskDetails.data?.result?.schedules.length} items',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ))
                    ],
                  ),
                  Consumer<TaskDetailsProvider>(builder: (context, provider, _) {
                    return TextButton(
                      onPressed: () async {
                        await launch(
                            'tel:+91${provider.taskDetails.data?.result?.task?.customerPhone}');
                      },
                      child: Text(
                        'Contact customer',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
                  // drop address and task status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Consumer<TaskDetailsProvider>(builder: (context, taskDetail, _) {
                          DropAddress? address =
                              taskDetail.taskDetails.data?.result?.schedules.first.dropAddress;
                          return Text(
                            [
                              address?.flatNo,
                              address?.street,
                              address?.area,
                              // address?.landmark,
                              address?.city,
                              // address?.state, // not getting state in drop address
                              // address?.country,
                              address?.pincode
                            ].takeWhile((value) => value != null).join(', '),
                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                          );
                        }),
                      ),
                      10.w,
                      Consumer<TaskDetailsProvider>(builder: (context, provider, _) {
                        String? status = provider.taskDetails.data?.result?.task?.status;
                        return Text(
                          status?.toUpperCase() ?? '',
                          style: TextStyle(
                              color: (status?.toLowerCase().contains('completed') ?? false)
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        );
                      })
                    ],
                  ),
                  6.h,
                  divider(),
                  // 12.h,
                  // assigned delivery partner
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Consumer<TaskDetailsProvider>(builder: (context, taskDetail, _) {
                          return Text(
                            taskDetail.taskDetails.data?.result?.task?.team?.name ?? '',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                          );
                        }),
                      ),
                      5.w,
                      TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                                constraints: BoxConstraints(
                                    maxWidth: 0.9 * MediaQuery.of(context).size.width),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(18),
                                        topRight: Radius.circular(18))),
                                context: context,
                                builder: (context) =>
                                    Consumer<TeamListProvider>(builder: (context, listProvider, _) {
                                      return ListView.separated(
                                          padding: EdgeInsets.all(18),
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) => InkWell(
                                                onTap: () async {
                                                  // update task list
                                                  await context
                                                      .read<TaskListProvider>()
                                                      .taskReassign(
                                                          taskId: widget.drop.taskId.toString(),
                                                          teamId: listProvider.listAll[index].teamId
                                                              .toString());

                                                  // update task details
                                                  await context
                                                      .read<TaskDetailsProvider>()
                                                      .getTaskDetails(
                                                          taskId: widget.drop.taskId.toString());

                                                  Navigator.pop(context);
                                                },
                                                child: Row(
                                                  children: [
                                                    Radio(
                                                      value: false,
                                                      groupValue: context
                                                              .read<TaskDetailsProvider>()
                                                              .taskDetails
                                                              .data
                                                              ?.result
                                                              ?.task
                                                              ?.teamId !=
                                                          listProvider.listAll[index].teamId,
                                                      onChanged: (_) {},
                                                    ),
                                                    5.w,
                                                    Text(
                                                      listProvider.listAll[index].name ?? '',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          separatorBuilder: (_, __) => 2.h,
                                          itemCount: listProvider.listAllActive.length);
                                    }));
                          },
                          child: Text(
                            'Change',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            // 12.h,
            // Row(
            //   children: [
            //     Icon(
            //       Icons.circle,
            //       color: Colors.green,
            //       size: 14,
            //     ),
            //     5.w,
            //     Text(
            //       'Out for delivery',
            //       style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
            //     ),
            //     Spacer(),
            //     Text(
            //       '12:30 pm',
            //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            //     )
            //   ],
            // ),
            // 6.h,
            // Row(
            //   children: [
            //     Icon(
            //       Icons.circle,
            //       color: Colors.green,
            //       size: 14,
            //     ),
            //     5.w,
            //     Text(
            //       'Reached for Delivery',
            //       style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
            //     ),
            //     Spacer(),
            //     Text(
            //       '02:00 pm',
            //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            //     )
            //   ],
            // ),
            // 6.h,
            // Row(
            //   children: [
            //     Icon(
            //       Icons.circle,
            //       color: Colors.grey,
            //       size: 14,
            //     ),
            //     5.w,
            //     Text(
            //       'Delivered',
            //       style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
            //     ),
            //     Spacer(),
            //     Text(
            //       '------',
            //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            //     )
            //   ],
            // ),
            12.h,
            Consumer<TaskDetailsProvider>(builder: (context, details, _) {
              return Column(
                children: List.generate(
                    details.taskDetails.data?.result?.schedules.length ?? 0,
                    (index) => DropItemBubble(
                        drop: widget.drop,
                        schedule: details.taskDetails.data!.result!.schedules[index],
                        itemNumber: index,
                        totalItems: details.taskDetails.data?.result?.schedules.length ?? 0)),
              );
            })
          ],
        ),
      ),
    );
  }
}

class DropItemBubble extends StatelessWidget {
  DropItemBubble(
      {Key? key,
      this.itemNumber = 0,
      this.totalItems = 0,
      required this.schedule,
      required this.drop})
      : super(key: key);
  final int itemNumber;
  final int totalItems;
  final Schedule schedule;
  final Drop drop;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2))
          ],
          color: Colors.white),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  schedule.projectDetails?.name.toUpperCase() ?? '',
                  style: TextStyle(
                      // color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Text(
                '(${itemNumber + 1} of $totalItems)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              )
            ],
          ),
          6.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '#${schedule.projectId}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
              Flexible(
                child: Text(
                  '${drop.creatorName.toUpperCase()}',
                  style: TextStyle(
                      fontSize: 12,
                      // color: Colors.grey,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          6.h,
          divider(),
          6.h,
          Text(
            '${schedule.state.toUpperCase()}',
            style: TextStyle(
                color:
                    schedule.state.toLowerCase().contains('finished') ? Colors.green : Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
