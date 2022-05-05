import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Models/TaskDetailsModel.dart';
import 'package:delivery/Providers/Manager/task_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Providers/Manager/tasklist_provider.dart';
import '../../Providers/Manager/team_list_provider.dart';
import 'my_team.dart';

class PickupTaskDetails extends StatefulWidget {
  const PickupTaskDetails({Key? key, required this.taskId}) : super(key: key);
  final int taskId;
  @override
  State<PickupTaskDetails> createState() => _PickupTaskDetailsState();
}

class _PickupTaskDetailsState extends State<PickupTaskDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<TaskDetailsProvider>().getTaskDetails(taskId: widget.taskId.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pickup task details'),
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
              .getTaskDetails(taskId: widget.taskId.toString());
        },
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(18),
          children: [
            Text(
              'Pickup from',
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
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Consumer<TaskDetailsProvider>(
                              builder: (context, provider, _) => Text(
                                    provider.taskDetails.data?.result?.task?.creatorName ?? '',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                  ))),
                      Consumer<TaskDetailsProvider>(
                          builder: (context, taskDetail, _) => Text(
                                '${taskDetail.taskDetails.data?.result?.schedules.length} items',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ))
                    ],
                  ),
                  Consumer<TaskDetailsProvider>(builder: (context, provider, _) {
                    return TextButton(
                      onPressed: () async {
                        await launch(
                            'tel:+91${provider.taskDetails.data?.result?.task?.creatorPhone}');
                      },
                      child: Text(
                        'Contact Seller',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Consumer<TaskDetailsProvider>(builder: (context, taskDetail, _) {
                          PickupAddress? address =
                              taskDetail.taskDetails.data?.result?.schedules.first.pickupAddress;
                          return Text(
                            [
                              address?.flatNo,
                              address?.street,
                              address?.area,
                              // address?.landmark,
                              address?.city,
                              // address?.state,
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
                                                          taskId: widget.taskId.toString(),
                                                          teamId: listProvider.listAll[index].teamId
                                                              .toString());

                                                  // update task details
                                                  await context
                                                      .read<TaskDetailsProvider>()
                                                      .getTaskDetails(
                                                          taskId: widget.taskId.toString());

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
                  )
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
            //       '<Pickup Accepted>',
            //       style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
            //     ),
            //     Spacer(),
            //     Text(
            //       '<09:10 am>',
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
            //       '<Reached for Pickup>',
            //       style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
            //     ),
            //     Spacer(),
            //     Text(
            //       '<09:35 am>',
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
            //       '<Parcel picked up>',
            //       style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
            //     ),
            //     Spacer(),
            //     Text(
            //       '<09:40 am>',
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
            //       '<Pickup Accepted>',
            //       style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
            //     ),
            //     Spacer(),
            //     Text(
            //       '<------>',
            //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            //     )
            //   ],
            // ),
            12.h,
            Consumer<TaskDetailsProvider>(builder: (context, details, _) {
              return Column(
                children: List.generate(
                    details.taskDetails.data?.result?.schedules.length ?? 0,
                    (index) => PickupItemBubble(
                        schedule: details.taskDetails.data!.result!.schedules[index],
                        itemNumber: index,
                        totalItems: details.taskDetails.data?.result?.schedules.length ?? 0)),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class PickupItemBubble extends StatelessWidget {
  PickupItemBubble({Key? key, this.itemNumber = 0, this.totalItems = 0, required this.schedule})
      : super(key: key);
  final int itemNumber;
  final int totalItems;
  final Schedule schedule;
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
                  schedule.projectDetails?.name ?? '',
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
          Text(
            '#${schedule.projectId}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          12.h,
          Text(
            'Customer name',
            style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            '${schedule.projectDetails?.firstname} ${schedule.projectDetails?.lastname}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          6.h,
          divider(),
          12.h,
          Text(
            'Delivery address',
            style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            [
              schedule.dropAddress?.flatNo,
              schedule.dropAddress?.street,
              schedule.dropAddress?.area,
              schedule.dropAddress?.landmark,
              schedule.dropAddress?.city,
              schedule.dropAddress?.country,
              schedule.dropAddress?.pincode,
            ].takeWhile((value) => value != null).join(', '), // '${schedule.dropAddress?.flatNo}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          6.h,
          divider(),
          12.h,
          Text(
            'Weight',
            style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            '${schedule.weight} kg',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          6.h,
          divider(),
          12.h,
          Text(
            'Delivery cost',
            style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            'Standard \u20b9${schedule.projectDetails?.totals?.shipping ?? 0}/-',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          6.h,
          divider(),
          12.h,
          Text(
            'Product type',
            style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            '${schedule.productType}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          6.h,
          divider(),
          12.h,
          Text(
            'State',
            style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            '${schedule.state.toUpperCase()}',
            style: TextStyle(
                color:
                    schedule.state.toLowerCase().contains('finished') ? Colors.green : Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          6.h,
        ],
      ),
    );
  }
}
