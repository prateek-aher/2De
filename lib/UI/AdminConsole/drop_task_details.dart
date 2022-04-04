import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:flutter/material.dart';

import 'my_team.dart';

class DropTaskDetails extends StatelessWidget {
  const DropTaskDetails({Key? key}) : super(key: key);

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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyTeam()));
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
            style: TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
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
                      'Viraj Patil',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Spacer(),
                    Text(
                      '02 items',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                6.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shiv Malhar Colony, Hadapsar, Pune',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 12),
                    ),
                    Spacer(),
                    Text(
                      'Picked up',
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
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
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
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
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
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
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
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
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
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
