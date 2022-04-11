import 'dart:io';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Network/upload_barcode_and_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class TakePhotoScreen extends StatefulWidget {
  const TakePhotoScreen(
      {Key? key, required this.package, /* this.onRefresh,*/ required this.barcode})
      : super(key: key);
  final String barcode;
  final Package package;
  // final VoidCallback? onRefresh;
  @override
  _TakePhotoScreenState createState() => _TakePhotoScreenState();
}

class _TakePhotoScreenState extends State<TakePhotoScreen> {
  File? xImage;

  Future<dynamic> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(
          maxHeight: 200,
          maxWidth: 200,
          source: ImageSource.camera,
          preferredCameraDevice: CameraDevice.rear);
      if (image == null) {
        Navigator.pop(context, false);
        return;
      }
      final capturedImage = File(image.path);
      widget.package.file = capturedImage;
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
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("Click Picture", style: TextStyle(color: Colors.black)),
            centerTitle: true),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              xImage != null ? Image.file(xImage!) : Container(),
              12.h,
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () async {
                          await pickImage();
                          // setState(() {});
                        },
                        child: Text('Click again',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                        style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(16)))),
                12.w,
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16)),
                        onPressed: () async {
                          await UploadService.send(
                              context: context,
                              deliveryId: widget.package.deliveryId.toString(),
                              barcode: widget.barcode,
                              file: xImage!);
                          Navigator.pop(context, true);
                        },
                        child: Text("Proceed",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))))
              ])
            ])));
  }
}
