import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Models/delivery_list_model.dart';
import 'package:delivery/Providers/Manager/delivery_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DeliveryList extends StatefulWidget {
  const DeliveryList({Key? key}) : super(key: key);

  @override
  State<DeliveryList> createState() => _DeliveryListState();
}

class _DeliveryListState extends State<DeliveryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Delivered'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Search bar
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

          // Tab Bar
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
          //   decoration:
          //       BoxDecoration(color: Color(0xfff4f3f8), borderRadius: BorderRadius.circular(12)),
          //   child: TabBar(
          //       padding: EdgeInsets.all(8),
          //       labelColor: Theme.of(context).primaryColor,
          //       unselectedLabelColor: Colors.black,
          //       indicatorColor: Colors.white,
          //       indicatorSize: TabBarIndicatorSize.tab,
          //       indicator: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(8),
          //           boxShadow: [
          //             BoxShadow(
          //                 offset: Offset(0, 3),
          //                 color: Colors.black.withOpacity(0.3),
          //                 blurRadius: 10,
          //                 spreadRadius: 2)
          //           ]),
          //       tabs: [
          //         Tab(
          //           text: 'Delivered(<10>)',
          //         ),
          //         Tab(
          //           text: 'Returned(<02>)',
          //         )
          //       ]),
          // ),
          // 12.h,

          // Tab bar view
          // Expanded(
          //     child: TabBarView(children: [
          //   //         RefreshIndicator(
          //   //         onRefresh: () async {
          //   // context.read<TeamListProvider>().getTeamList();
          //   // },
          //   //   child: ListView.separated(
          //   //     shrinkWrap: true,
          //   //     itemCount: listProvider.listBikes.length,
          //   //     separatorBuilder: (BuildContext context, int index) => 22.h,
          //   //     itemBuilder: (BuildContext context, int index) => DeliveryBoyTile(
          //   //       name: listProvider.listBikes[index].name ?? '',
          //   //       // area: listProvider.listBikes[index].area??'',
          //   //       status: listProvider.listBikes[index].status ?? false,
          //   //       teamId: listProvider.listBikes[index].teamId!,
          //   //     ),
          //   //   ),
          //   // ),
          //   // RefreshIndicator(
          //   //   onRefresh: () async {
          //   //     context.read<TeamListProvider>().getTeamList();
          //   //   },
          //   //   child: ListView.separated(
          //   //     shrinkWrap: true,
          //   //     itemCount: listProvider.listCars.length,
          //   //     separatorBuilder: (BuildContext context, int index) => 22.h,
          //   //     itemBuilder: (BuildContext context, int index) => DeliveryBoyTile(
          //   //       name: listProvider.listCars[index].name ?? '',
          //   //       // area: listProvider.listCars[index].area??'',
          //   //       status: listProvider.listCars[index].status ?? false,
          //   //       teamId: listProvider.listCars[index].teamId!,
          //   //     ),
          //   //   ),
          //   // )
          // ]))
          Expanded(
              child: RefreshIndicator(
            displacement: 20,
            onRefresh: () async {
              await context.read<DeliveryListProvider>().refreshDeliveryList();
            },
            child: ListView(
              shrinkWrap: true,
              children: context
                  .read<DeliveryListProvider>()
                  .deliveryList
                  .map((e) => DeliveryWidget(delivery: e))
                  .toList(),
            ),
          ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (context.read<DeliveryListProvider>().deliveryList.isEmpty) {
        context.read<DeliveryListProvider>().refreshDeliveryList();
      }
    });
  }
}

class DeliveryWidget extends StatelessWidget {
  const DeliveryWidget({Key? key, required this.delivery}) : super(key: key);
  final Delivery delivery;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
      padding: const EdgeInsets.all(12),
      // height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xfff4f3f8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.transparent)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Delivered on ${delivery.dropTime?.day}-${delivery.dropTime?.month}-${delivery.dropTime?.year}',
                style: TextStyle(fontSize: 12, color: Colors.green),
              ),
              Spacer(),
              Icon(
                Icons.access_time_rounded,
                color: Colors.black,
                size: 12,
              ),
              Text(
                '${delivery.dropTime?.hour}:${delivery.dropTime?.minute} ${delivery.dropTime?.timeZoneName}',
                style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          12.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${delivery.productType}',
                style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                '#${delivery.projectId}',
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          12.h,
          Text(
            'Ordered by: ${delivery.dropAddress?.firstname} ${delivery.dropAddress?.lastname}',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            'Sold by: ${delivery.pickupAddress?.firstname} ${delivery.pickupAddress?.lastname}',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            'Weight: ${delivery.weight}kg',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            'Payment ID: ${delivery.paymentId}',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal),
          ),
          6.h,
          Text(
            'Pickup time: ${delivery.pickupTime?.hour}:${delivery.pickupTime?.minute} ${delivery.pickupTime?.timeZoneName}',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal),
          ),
          6.h,
        ],
      ),
    );
  }
}
