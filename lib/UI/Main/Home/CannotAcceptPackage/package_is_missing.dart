import 'package:flutter/material.dart';

class PackageIsMissing extends StatelessWidget {
  const PackageIsMissing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Package is Missing'),
      ),
    );
  }
}
