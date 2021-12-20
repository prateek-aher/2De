import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class TakePhotoScreen extends StatefulWidget {
  const TakePhotoScreen({Key? key}) : super(key: key);

  @override
  _TakePhotoScreenState createState() => _TakePhotoScreenState();
}

class _TakePhotoScreenState extends State<TakePhotoScreen> {
  File? xImage;
  // late CameraController _controller;
  // late Future<void> _initializeControllerFuture;

  // _camDesc() async {
  //   _controller = CameraController(
  //     getCamDescription,
  //     ResolutionPreset.medium,
  //     enableAudio: false,
  //   );
  //   // Next, initialize the controller. This returns a Future.
  //   _initializeControllerFuture = _controller.initialize();
  // }

  Future<dynamic> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Click Picture",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: xImage != null ? Image.file(xImage!) : Container(),
      // body: FutureBuilder(
      //   future: pickImage(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       return SafeArea(
      //         child: CameraPreview(
      //           _controller,
      //         ),
      //       );
      //     } else
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     try {
      //       // Ensure that the camera is initialized.
      //       await _initializeControllerFuture;
      //       final image = await _controller.takePicture();

      //       print(image.path);
      //     } catch (e) {
      //       // If an error occurs, log the error to the console.
      //       print(e);
      //     }
      //   },
      // ),
    );
  }
}
