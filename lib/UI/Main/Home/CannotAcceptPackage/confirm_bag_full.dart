import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:flutter/material.dart';

class ConfirmBagFull extends StatelessWidget {
  const ConfirmBagFull({Key? key}) : super(key: key);

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
            sbh(32),
            Text(
              'Your bag is full?',
              style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w500,
                  color: BLACK1),
            ),
            sbh(16),
            Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            sbh(32),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Bag Full',
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
            sbh(48),
            goBackButton(context),
          ],
        ),
      ),
    );
  }
}
