import 'package:flutter/material.dart';

class WithDrawMoney extends StatefulWidget {
  const WithDrawMoney({Key? key}) : super(key: key);

  @override
  _WithDrawMoneyState createState() => _WithDrawMoneyState();
}

class _WithDrawMoneyState extends State<WithDrawMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Withdraw Money"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Text("How much money do you want to Withdraw?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ))
        ]),
      ),
    );
  }
}
