import 'package:flutter/material.dart';

class InsuranceDetails extends StatelessWidget {
  const InsuranceDetails({Key? key}) : super(key: key);

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
            'Insurance Details',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Container(
          // width: double.infinity,
          color: Colors.white,

          height: 600,
        ),
      ),
    );
  }
}
