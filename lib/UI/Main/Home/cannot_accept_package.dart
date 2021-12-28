import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/UI/Main/Home/CannotAcceptPackage/confirm_bag_full.dart';
import 'package:delivery/UI/Main/Home/CannotAcceptPackage/issue_with_package.dart';
import 'package:delivery/UI/Main/Home/CannotAcceptPackage/no_barcode.dart';
import 'package:delivery/UI/Main/Home/CannotAcceptPackage/package_is_missing.dart';
import 'package:flutter/material.dart';

import 'CannotAcceptPackage/other.dart';

class CannotAcceptPackage extends StatelessWidget {
  const CannotAcceptPackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cannot accept package'),
      ),
      body: ListView(
        children: [
          ItemTile(
            title: 'Bag Full',
            sendTo: ConfirmBagFull(),
          ),
          greyDivider(),
          ItemTile(
            title: 'Issue with Package',
            sendTo: IssueWithPackage(),
          ),
          greyDivider(),
          ItemTile(
            title: 'Package is Missing',
            sendTo: PackageIsMissing(),
          ),
          greyDivider(),
          ItemTile(
            title: 'No Barcode/ ID',
            sendTo: NoBarcode(),
          ),
          greyDivider(),
          ItemTile(
            title: 'Other',
            sendTo: Other(),
          ),
          greyDivider(),
        ],
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final String? title;
  final Widget? sendTo;

  const ItemTile({
    Key? key,
    this.title,
    this.sendTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title ?? '',
        style: TextStyle(fontSize: 18),
      ),
      onTap: sendTo == null
          ? null
          : () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => sendTo!));
            },
      contentPadding: EdgeInsets.all(16),
    );
  }
}
