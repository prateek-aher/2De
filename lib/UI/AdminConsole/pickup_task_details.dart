import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Providers/Manager/task_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_team.dart';

class PickupTaskDetails extends StatefulWidget {
  const PickupTaskDetails({Key? key, required this.taskId}) : super(key: key);
  final int taskId;
  @override
  State<PickupTaskDetails> createState() => _PickupTaskDetailsState();
}

class _PickupTaskDetailsState extends State<PickupTaskDetails> {
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
      body: ListView(
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '<Seller Name>',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Spacer(),
                    Consumer<TaskDetailsProvider>(builder: (context, taskDetail, _) {
                      return Text(
                        '${taskDetail.taskDetails.data?.result?.schedules.length} items',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      );
                    })
                  ],
                ),
                6.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '<Shiv Malhar Colony, Hadapsar, Pune>',
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                    ),
                    Spacer(),
                    Text(
                      '<Picked up>',
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
                      '<Rajshekhar>',
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
                '<Pickup Accepted>',
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Spacer(),
              Text(
                '<09:10 am>',
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
                '<Reached for Pickup>',
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Spacer(),
              Text(
                '<09:35 am>',
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
                '<Parcel picked up>',
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Spacer(),
              Text(
                '<09:40 am>',
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
                '<Pickup Accepted>',
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Spacer(),
              Text(
                '<------>',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              )
            ],
          ),
          12.h,
          ...List.generate(2, (index) => ProductBubble(itemNumber: index))
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

class ProductBubble extends StatelessWidget {
  ProductBubble({Key? key, this.itemNumber = 0}) : super(key: key);
  int itemNumber;
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
                '<Product name>',
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
          Text(
            '#<Delivery ID>',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            'Seller',
            style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
          ),
          Text(
            '<seller name>',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          6.h,
          divider(),
          6.h,
          Text(
            'Address',
            style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            '<Full address>',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          6.h,
          divider(),
          6.h,
          Text(
            'Weight',
            style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            '<Weight range>',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          6.h,
          divider(),
          6.h,
          Text(
            'Delivery cost',
            style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            'Standard \u20b9<cost>/-',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
