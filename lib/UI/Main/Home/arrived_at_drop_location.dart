import 'package:delivery/CommonWidget/custom_appbar.dart';
import 'package:flutter/material.dart';

class ArrivedAtDropLocation extends StatefulWidget {
  const ArrivedAtDropLocation({Key? key}) : super(key: key);

  @override
  State<ArrivedAtDropLocation> createState() => _ArrivedAtDropLocationState();
}

class _ArrivedAtDropLocationState extends State<ArrivedAtDropLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
    );
  }
}
