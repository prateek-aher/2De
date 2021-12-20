import 'package:delivery/UI/Main/WithdrawMoney.dart';
import 'package:flutter/material.dart';

class Passbook extends StatefulWidget {
  const Passbook({Key? key}) : super(key: key);

  @override
  _PassbookState createState() => _PassbookState();
}

class _PassbookState extends State<Passbook> {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Weekly Earnings",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
            ListTile(
              leading: Container(
                  height: 30, width: 30, child: Image.asset("assets/doc.png")),
              title: Text("Earning History"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: Container(
                  height: 30,
                  width: 30,
                  child: Image.asset("assets/rupee.png")),
              title: Text("Edit Bank Account Details"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            )
          ],
        ),
      ),
    );
  }
}
