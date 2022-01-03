import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:flutter/material.dart';

class NoShow extends StatelessWidget {
  const NoShow({Key? key}) : super(key: key);

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
              'No Show?',
              style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w500,
                  color: BLACK1),
            ),
            16.h,
            Text(
              'In case the customer do not show up to pick the package you may click “End Task” and find your next task.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            32.h,
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'End Task',
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
