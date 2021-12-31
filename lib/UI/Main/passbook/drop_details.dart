import 'package:flutter/material.dart';

class DropDetails extends StatelessWidget {
  const DropDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop details'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
