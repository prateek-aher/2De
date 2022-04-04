import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:flutter/material.dart';

import 'my_team.dart';

class PickupTaskDetails extends StatelessWidget {
  const PickupTaskDetails({Key? key}) : super(key: key);

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
            'Pickup from',
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
                'Pickup Accepted',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Spacer(),
              Text(
                '09:10 am',
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
                'Reached for Pickup',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Spacer(),
              Text(
                '09:35 am',
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
                'Parcel picked up',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Spacer(),
              Text(
                '09:40 am',
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
                'Pickup Accepted',
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
          ...List.generate(2, (index) => ProductBubble(itemNumber: index))
        ],
      ),
    );
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
          Text(
            '#3261736571',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            'Customer name',
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.normal),
          ),
          Text(
            'Viraj Patil',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          6.h,
          divider(),
          6.h,
          Text(
            'Delivery address',
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            'Building 5A-200, Kalpataru Heights, Shivmalhar colony, Hadapsar, Pune, Maharashtra, India',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          6.h,
          divider(),
          6.h,
          Text(
            'Weight',
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            '0 Kg - 2.5 Kg',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          6.h,
          divider(),
          6.h,
          Text(
            'Delivery cost',
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            'Standard \u20b940/-',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
