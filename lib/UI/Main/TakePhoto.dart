import 'dart:io';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Providers/FindTaskProvider.dart';
import 'package:delivery/UI/Main/Home/pickup_package.dart';
import 'package:delivery/Utils/enumerations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/src/provider.dart';

import 'Home/rate_cutomer.dart';

class TakePhotoScreen extends StatefulWidget {
  const TakePhotoScreen({Key? key}) : super(key: key);

  @override
  _TakePhotoScreenState createState() => _TakePhotoScreenState();
}

class _TakePhotoScreenState extends State<TakePhotoScreen> {
  File? xImage;

  Future<dynamic> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
      if (image == null) {
        Navigator.pop(context);
        return;
      }
      final capturedImage = File(image.path);
      setState(() => this.xImage = capturedImage);
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  void initState() {
    pickImage();
    super.initState();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskType = context.read<FindTaskProvider>().taskType;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Click Picture",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  xImage != null ? Image.file(xImage!) : Container(),
                  12.h,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () async {
                          await pickImage();
                          setState(() {});
                        },
                        child: Text(
                          'Click again',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(16)),
                      ),
                    ),
                    12.w,
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16)),
                            onPressed: () {
                              if (taskType == TaskType.pickup) {
                                context.read<FindTaskProvider>().taskType =
                                    TaskType.drop;
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => PickupPackage()));
                              } else {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => RateCustomer()));
                              }
                            },
                            child: Text("Proceed",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500))))
                  ])
                ])));
  }
}
