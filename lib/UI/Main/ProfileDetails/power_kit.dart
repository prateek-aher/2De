import 'package:flutter/material.dart';

class PowerKit extends StatefulWidget {
  const PowerKit({Key? key}) : super(key: key);

  @override
  State<PowerKit> createState() => _PowerKitState();
}

class _PowerKitState extends State<PowerKit> {
  List<Map<String, dynamic>> list = [
    {
      'title': 'Helmet',
      'requestPending': false,
      'isChecked': false,
    },
    {
      'title': 'Bag',
      'isChecked': false,
      'requestPending': true,
    },
    {
      'title': 'Mobile Mount',
      'isChecked': false,
      'requestPending': false,
    },
    {
      'title': 'Rain Gear',
      'isChecked': false,
      'requestPending': false,
    },
    {
      'title': 'Marker',
      'isChecked': false,
      'requestPending': false,
    },
    {
      'title': 'Barcode Strip',
      'isChecked': false,
      'requestPending': false,
    },
    {
      'title': 'Duct tape',
      'isChecked': false,
      'requestPending': false,
    },
    {
      'title': 'Duct tape',
      'isChecked': false,
      'requestPending': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF7F9FB),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Power Kit',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            // width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consetetur sadipscing',
                    maxLines: 1,
                  ),
                ),
                SizedBox(height: 24),
                ...List.generate(
                    list.length, (index) => buildTile(list[index])),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTile(Map<String, dynamic> map) => ListTile(
        title: Text(map['title']),
        leading: Checkbox(
            activeColor: Colors.green,
            value: map['requestPending']
                ? map['requestPending']
                : map['isChecked'],
            onChanged: map['requestPending']
                ? null
                : (truth) {
                    setState(() {
                      map['isChecked'] = truth;
                    });
                  }),
        trailing: TextButton(
            onPressed: map['requestPending'] ? null : () {},
            child: map['requestPending']
                ? Text(
                    'Requested',
                    style: TextStyle(color: Colors.green),
                  )
                : Text('Request')),
      );
}
