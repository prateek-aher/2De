import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:flutter/material.dart';

class PackageIsMissing extends StatelessWidget {
  const PackageIsMissing({Key? key}) : super(key: key);

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
              'Package is Missing?',
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
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Package Missing',
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
