import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:flutter/material.dart';

class NoBarcode extends StatefulWidget {
  const NoBarcode({Key? key}) : super(key: key);

  @override
  State<NoBarcode> createState() => _NoBarcodeState();
}

class _NoBarcodeState extends State<NoBarcode> {
  String code = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            32.h,
            Text(
              'No Barcode or ID',
              style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w500,
                  color: BLACK1),
            ),
            16.h,
            Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            32.h,
            if (code.isNotEmpty) ...[
              Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    'code',
                    style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor),
                  ))),
              2.h
            ],
            ElevatedButton(
              onPressed: () {
                if (code.isEmpty) {
                  // TODO: Fetch code
                } else {
                  // TODO: submit with new code
                }
              },
              child: Text(
                code.isEmpty ? 'Next' : 'Finish',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 51, vertical: 16)),
            ),
            48.h,
            goBackButton(context),
          ],
        ),
      ),
    );
  }
}
