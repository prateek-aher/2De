import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:flutter/material.dart';

class Other extends StatelessWidget {
  const Other({Key? key}) : super(key: key);

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
              'Other issue with the package?',
              textAlign: TextAlign.center,
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
            sbh(48),
            Text(
              'Call Hub Manager',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w500,
                  color: BLACK1),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8)),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.1,
                      backgroundColor: Colors.grey[300]!,
                      child: Image.network(
                        'https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/avat-01-512.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mahendra Singh Dhoni',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '+91 9765886434',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(width: 12),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.call,
                            color: Theme.of(context).primaryColor,
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
