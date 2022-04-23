import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Providers/Manager/task_details_provider.dart';
import 'my_team.dart';

class DropTaskDetails extends StatefulWidget {
  const DropTaskDetails({Key? key, required this.taskId}) : super(key: key);
  final int taskId;

  @override
  State<DropTaskDetails> createState() => _DropTaskDetailsState();
}

class _DropTaskDetailsState extends State<DropTaskDetails> {
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
      body: ListView(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<TaskDetailsProvider>(builder: (context, provider, _) {
                      return Text(
                        provider.taskDetails.data?.result?.task?.customerName ?? '',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      );
                    }),
                    Spacer(),
                    Consumer<TaskDetailsProvider>(builder: (context, provider, _) {
                      return Text(
                        '${provider.taskDetails.data?.result?.schedules.length} items',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      );
                    })
                  ],
                ),
                // 6.h,
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
                    TextButton(onPressed: () {}, child: Text('View Status'))
                  ],
                )
              ],
            ),
          ),
          12.h,
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.green,
                size: 14,
              ),
              5.w,
              Text(
                'Out for delivery',
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Spacer(),
              Text(
                '12:30 pm',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              )
            ],
          ),
          6.h,
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.green,
                size: 14,
              ),
              5.w,
              Text(
                'Reached for Delivery',
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Spacer(),
              Text(
                '02:00 pm',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              )
            ],
          ),
          6.h,
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 14,
              ),
              5.w,
              Text(
                'Delivered',
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Spacer(),
              Text(
                '------',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              )
            ],
          ),
          12.h,
          ...List.generate(2, (index) => ItemBubble(itemNumber: index))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<TaskDetailsProvider>().getTaskDetails(taskId: widget.taskId.toString());
    });
  }
}

class ItemBubble extends StatelessWidget {
  ItemBubble({Key? key, this.itemNumber = 0}) : super(key: key);
  final int itemNumber;
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
            children: [
              Text(
                'Product name',
                style: TextStyle(
                    // color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Spacer(),
              Text(
                '(0${itemNumber + 1} of 02)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              )
            ],
          ),
          6.h,
          Row(
            children: [
              Text(
                '#3261736571',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
              Spacer(),
              Text(
                '(Customer name)',
                style: TextStyle(
                    fontSize: 12,
                    // color: Colors.grey,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
