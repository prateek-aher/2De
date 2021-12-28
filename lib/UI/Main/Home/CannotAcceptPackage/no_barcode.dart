import 'package:flutter/material.dart';

class NoBarcode extends StatelessWidget {
  const NoBarcode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No Barcode/ ID'),
      ),
    );
  }
}
