import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EarningHistoryFilter extends StatefulWidget {
  const EarningHistoryFilter({Key? key}) : super(key: key);

  @override
  State<EarningHistoryFilter> createState() => _EarningHistoryFilterState();
}

class _EarningHistoryFilterState extends State<EarningHistoryFilter> {
  final _list = const [
    {
      'title': 'Last 1 month',
      'value': '1m',
    },
    {
      'title': 'Last 3 month',
      'value': '3m',
    },
    {
      'title': 'Last 6 month',
      'value': '6m',
    },
    {
      'title': 'Last 1 year',
      'value': '1y',
    },
  ];
  String _groupValue = '1m';

  int to = 1;
  int from = 1;

  DateTimeRange? dateRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Earning History'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 24),
        children: [
          ...List.generate(
              _list.length,
              (index) => RadioListTile<String>(
                  value: _list[index]['value']!,
                  title: Text(_list[index]['title']!),
                  groupValue: _groupValue,
                  onChanged: (v) {
                    setState(() {
                      _groupValue = v!;
                    });
                  })),
          RadioListTile<String>(
              value: 'select',
              title: Text('Select duration'),
              groupValue: _groupValue,
              onChanged: (v) {
                setState(() {
                  _groupValue = v!;
                });
              }),
          Visibility(
            visible: _groupValue == 'select',
            child: ListTile(
              minLeadingWidth: 40,
              leading: 0.w,
              trailing: IconButton(
                onPressed: () async {
                  DateTimeRange? range = await showDateRangePicker(
                    context: context,
                    cancelText: 'nope',
                    firstDate:
                        DateTime.now().subtract(Duration(days: 365 * 10)),
                    lastDate: DateTime.now(),
                  );
                  setState(() {
                    dateRange = range ?? dateRange;
                  });
                },
                icon: Icon(Icons.edit),
                color: Theme.of(context).primaryColor,
              ),
              title: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('From',
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor)),
                      dateRange != null
                          ? Text(
                              DateFormat('d MMM y').format(dateRange!.start),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          : 0.w,
                    ],
                  ),
                  12.w,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('To',
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor)),
                      dateRange != null
                          ? Text(
                              DateFormat('d MMM y').format(dateRange!.end),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          : 0.w,
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -8),
              blurRadius: 20,
              spreadRadius: 0)
        ]),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'View Statement',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500),
                  ),
                ),
                style:
                    ElevatedButton.styleFrom(padding: const EdgeInsets.all(18)),
              ),
            ),
            12.w,
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text('Download History',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w500)),
                ),
                style:
                    ElevatedButton.styleFrom(padding: const EdgeInsets.all(18)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
