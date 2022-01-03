import 'dart:io';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class IssueWithPackage extends StatefulWidget {
  const IssueWithPackage({Key? key}) : super(key: key);

  @override
  State<IssueWithPackage> createState() => _IssueWithPackageState();
}

class _IssueWithPackageState extends State<IssueWithPackage> {
  File? xImage;

  @override
  void initState() {
    pickImage();
    super.initState();
  }

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
              'Issue with Package',
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
            16.h,
            if (xImage != null)
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey)),
                  child: Image.file(xImage!))
            else
              InkWell(
                onTap: pickImage,
                child: Ink(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.camera)),
              ),
            24.h,
            ElevatedButton(
              onPressed: xImage == null ? null : () {},
              child: Text(
                'Send Picture',
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

  Future<dynamic> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
      if (image == null) return;
      final capturedImage = File(image.path);
      setState(() => this.xImage = capturedImage);
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
