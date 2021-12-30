import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/UI/Main/passbook/WithdrawMoney.dart';
import 'package:delivery/UI/Main/passbook/hub_drop_details.dart';
import 'package:delivery/UI/Main/passbook/hub_pickup_details.dart';
import 'package:delivery/UI/Main/passbook/pickup_details.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:flutter/material.dart';

import 'passbook/drop_details.dart';
import 'passbook/earning_history_filter.dart';

class Passbook extends StatefulWidget {
  const Passbook({Key? key}) : super(key: key);

  @override
  _PassbookState createState() => _PassbookState();
}

class _PassbookState extends State<Passbook> {
  int weeklyEarning = 6012;
  Map<String, dynamic> dailyEarnings = const {
    'date': '03 Jan 2020',
    'items': [
      {
        'imageUrl':
            'https://www.fedex.com/content/dam/fedex/us-united-states/FedEx-Office/images/2021/q1/P03110_FY20FDMLP_SignforPackagesImage_727x463.jpg',
        'task': 'Pick-up',
        'earning': '+15',
        'id': 223212,
        'closing_balance': 370,
      },
      {
        'imageUrl':
            'https://www.fedex.com/content/dam/fedex/us-united-states/FedEx-Office/images/2021/q1/P03110_FY20FDMLP_SignforPackagesImage_727x463.jpg',
        'task': 'Pick-up',
        'earning': '+15',
        'id': 223212,
        'closing_balance': 370,
      },
      {
        'imageUrl':
            'https://us.123rf.com/450wm/kchung/kchung1706/kchung170600676/80865035-black-3d-rendering-blank-square-box-with-separate-lid-isolated-gray-background.jpg?ver=6',
        'task': 'Drop off',
        'earning': '+15',
        'id': 223212,
        'closing_balance': 370,
      },
      {
        'imageUrl':
            'https://us.123rf.com/450wm/kchung/kchung1706/kchung170600676/80865035-black-3d-rendering-blank-square-box-with-separate-lid-isolated-gray-background.jpg?ver=6',
        'task': 'Drop off',
        'earning': '+15',
        'id': 223212,
        'closing_balance': 370,
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final pageMargin = const EdgeInsets.symmetric(horizontal: 15);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("PassBook"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WithDrawMoney()));
              },
              icon: Image.asset("assets/monetransfer.png"))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {});
        },
        child: ListView(
          children: [
            // header
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: pageMargin.add(EdgeInsets.only(top: 16)),
                    padding: pageMargin.add(EdgeInsets.symmetric(vertical: 16)),
                    decoration: BoxDecoration(
                      border: Border.all(color: GREY7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Weekly Earnings",
                          style: TextStyle(
                              fontFamily: 'WorkSans',
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '\u20b9$weeklyEarning',
                          style: TextStyle(
                              fontFamily: 'WorkSans',
                              fontSize: 34,
                              color: Colors.green,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Container(
                        height: 30,
                        width: 30,
                        child: Image.asset("assets/doc.png")),
                    title: Text("Earning History"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  divider(),
                  ListTile(
                    leading: Container(
                        height: 30,
                        width: 30,
                        child: Image.asset("assets/rupee.png")),
                    title: Text("Edit Bank Account Details"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ],
              ),
            ),
            Container(
              margin: pageMargin.add(EdgeInsets.symmetric(vertical: 8)),
              child: Row(
                children: [
                  TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EarningHistoryFilter()));
                      },
                      icon: Image.asset(
                        'assets/filter.png',
                        scale: 2,
                      ),
                      label: Text(
                        'Filter',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'WorkSans',
                            fontSize: 16,
                            color: BLACK3),
                      )),
                  Spacer(),
                  Image.asset(
                    'assets/search.png',
                    scale: 2,
                  ),
                ],
              ),
            ),
            Container(
              padding: pageMargin,
              color: Theme.of(context).primaryColor,
              height: 30,
              alignment: Alignment.centerLeft,
              child: Text(
                '${dailyEarnings['date']}',
                style: TextStyle(color: Colors.white),
              ),
            ),

            ...dailyEarnings['items'].map((x) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => x['task'] == 'Pick-up'
                                ? PickupDetails()
                                : DropDetails()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: GREY7)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 16),
                          width: 70,
                          height: 70,
                          // width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: GREY7),
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(x['imageUrl']),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${x['task']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'WorkSans',
                                  fontSize: 16,
                                  color: BLACK1),
                            ),
                            sbh(12),
                            Text(
                                '${x['earning'].toString().substring(0, 1) + '\u20b9' + x['earning'].toString().substring(1)}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.green)),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '#${x['id']}',
                              style: TextStyle(fontSize: 16, color: BLACK3),
                            ),
                            sbh(12),
                            Text(
                                'Closing balance: \u20b9${x['closing_balance']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'WorkSans',
                                    fontSize: 14,
                                    color: BLACK1)),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),

            // hub entry
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: GREY8,
                    border: Border.all(color: GREY7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Hub(Cash submitted)',
                          style: TextStyle(
                              color: BLACK1,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cash given to Mukesh',
                              style: TextStyle(
                                  color: BLACK1,
                                  fontSize: 14,
                                  fontFamily: 'WorkSans',
                                  fontWeight: FontWeight.w500)),
                          Text('\u20b91500',
                              style: TextStyle(
                                  color: BLACK1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ),
                greyDivider(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HubDropDetails()));
                  },
                  child: Container(
                    // height: 90,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: GREY8,
                      border: Border.all(color: GREY7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Hub(Drop)',
                                style: TextStyle(
                                    color: BLACK1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Text('6 items',
                                style: TextStyle(
                                    color: BLACK1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        sbh(12),
                        Row(
                          children: [
                            ...List.generate(
                                3,
                                (index) => Expanded(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 16),
                                              width: 70,
                                              height: 70,
                                              // width: 100,
                                              decoration: BoxDecoration(
                                                  border:
                                                      Border.all(color: GREY7),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://www.fedex.com/content/dam/fedex/us-united-states/FedEx-Office/images/2021/q1/P03110_FY20FDMLP_SignforPackagesImage_727x463.jpg'),
                                                    fit: BoxFit.cover,
                                                  )),
                                            ),
                                            Text('#223212'),
                                          ],
                                        ),
                                      ),
                                    )),
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 16),
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: GREY7),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                          child: Text(
                                        '+3\nview all',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 14,
                                            fontFamily: 'WorkSans',
                                            fontWeight: FontWeight.w500),
                                      )),
                                    ),
                                    sbh(16)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                greyDivider(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HubPickupDetails()));
                  },
                  child: Container(
                    // height: 90,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: GREY8,
                      border: Border.all(color: GREY7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Hub(Pickup)',
                                style: TextStyle(
                                    color: BLACK1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Text('6 items',
                                style: TextStyle(
                                    color: BLACK1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        sbh(12),
                        Row(
                          children: [
                            ...List.generate(
                                3,
                                (index) => Expanded(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 16),
                                              width: 70,
                                              height: 70,
                                              // width: 100,
                                              decoration: BoxDecoration(
                                                  border:
                                                      Border.all(color: GREY7),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://www.tinyredbox.com.au/wp-content/uploads/2021/05/TinyRedBox-scaled-e1620823751100-768x577.jpg'),
                                                    fit: BoxFit.cover,
                                                  )),
                                            ),
                                            Text('#223212'),
                                          ],
                                        ),
                                      ),
                                    )),
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 16),
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: GREY7),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                          child: Text(
                                        '+3\nview all',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 14,
                                            fontFamily: 'WorkSans',
                                            fontWeight: FontWeight.w500),
                                      )),
                                    ),
                                    sbh(22)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                greyDivider(),
              ],
            ),

            ...dailyEarnings['items'].map((x) => Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: GREY7)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 16),
                        width: 70,
                        height: 70,
                        // width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: GREY7),
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(x['imageUrl']),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${x['task']}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'WorkSans',
                                fontSize: 16,
                                color: BLACK1),
                          ),
                          sbh(12),
                          Text(
                              '${x['earning'].toString().substring(0, 1) + '\u20b9' + x['earning'].toString().substring(1)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.green)),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '#${x['id']}',
                            style: TextStyle(fontSize: 16, color: BLACK3),
                          ),
                          sbh(12),
                          Text('Closing balance: \u20b9${x['closing_balance']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'WorkSans',
                                  fontSize: 14,
                                  color: BLACK1)),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
