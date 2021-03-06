import 'dart:io';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/CustomSnackBar.dart';
import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/UI/Main/TakePhoto.dart';
import 'package:delivery/Utils/enumerations.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// ignore: must_be_immutable
class QRScanScreen extends StatefulWidget {
  QRScanScreen({
    Key? key,
    required this.package,
    required this.taskType,
    /*this.onRefresh*/
  }) : super(key: key);
  final Package package;
  final TaskType taskType;
  // VoidCallback? onRefresh;
  @override
  _QRScanScreenState createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  late final TextEditingController _qrTextController;
  bool showScanner = true;
  final GlobalKey _qrKey = GlobalKey(
    debugLabel: 'QR',
  );
  final _codeKey = GlobalKey<FormState>();
  QRViewController? controller;

  bool isObtainedFromScanner = false;

  String? barCode;

  bool goodToGo = false;

  @override
  void initState() {
    _qrTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    _qrTextController.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        barCode = scanData.code;
        _qrTextController.text = barCode!;
        showScanner = false;
        isObtainedFromScanner = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: 0.h,
          backgroundColor: Colors.white,
          title: Text(
            "Scan QR Code",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(children: [
                  24.h,
                  Visibility(
                    visible: showScanner,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Place The QR Code Inside The Area',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        6.h,
                        Text(
                          'Scanning Will Start Automatically',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        12.h,

                        // QR view
                        Stack(
                          children: [
                            SizedBox(
                                height: MediaQuery.of(context).size.width * 0.99,
                                width: MediaQuery.of(context).size.width * 0.99,
                                child: QRView(
                                  key: _qrKey,
                                  onQRViewCreated: _onQRViewCreated,
                                  overlay: QrScannerOverlayShape(
                                    borderColor: Colors.white,
                                    overlayColor: Colors.black.withOpacity(0.5),
                                  ),
                                )),
                            Positioned(
                              top: MediaQuery.of(context).size.width * 0.29 / 2,
                              // bottom: 0,
                              left: MediaQuery.of(context).size.width * 0.29 / 2,
                              // right: 0,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(color: Colors.blue, width: 4),
                                        left: BorderSide(color: Colors.blue, width: 4))),
                              ),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.width * 0.29 / 2,
                              // bottom: 0,
                              right: MediaQuery.of(context).size.width * 0.29 / 2,
                              // right: 0,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(color: Colors.blue, width: 4),
                                        right: BorderSide(color: Colors.blue, width: 4))),
                              ),
                            ),
                            Positioned(
                              right: MediaQuery.of(context).size.width * 0.29 / 2,
                              // bottom: 0,
                              bottom: MediaQuery.of(context).size.width * 0.29 / 2,
                              // right: 0,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(color: Colors.blue, width: 4),
                                        bottom: BorderSide(color: Colors.blue, width: 4))),
                              ),
                            ),
                            Positioned(
                              bottom: MediaQuery.of(context).size.width * 0.29 / 2,
                              // bottom: 0,
                              left: MediaQuery.of(context).size.width * 0.29 / 2,
                              // right: 0,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: Colors.blue, width: 4),
                                        left: BorderSide(color: Colors.blue, width: 4))),
                              ),
                            ),
                          ],
                        ),
                        24.h,

                        TextButton(
                            onPressed: () {
                              setState(() {
                                showScanner = false;
                              });
                            },
                            child: Text('Enter code manually')),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !showScanner,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: isObtainedFromScanner,
                              child: Column(
                                children: [
                                  Text("Package code",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                  12.h,
                                  Text(
                                    '$barCode',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: !isObtainedFromScanner,
                              child: Form(
                                key: _codeKey,
                                child: TextFormField(
                                    validator: (v) {
                                      if (v?.isEmpty ?? false) {
                                        return 'Package code needed';
                                      }
                                      if (widget.taskType == TaskType.hubDrop ||
                                          widget.taskType == TaskType.drop) {
                                        if (v != widget.package.barCode)
                                          return "Code doesn't match with code scanned at pickup";
                                      }
                                      return null;
                                    },
                                    controller: _qrTextController,
                                    textCapitalization: TextCapitalization.characters,
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.streetAddress,
                                    decoration: InputDecoration(
                                        hintText: 'Enter code here',
                                        hintStyle:
                                            TextStyle(fontSize: 20, color: Colors.grey[400]))),
                              ),
                            ),
                            24.h,
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 16)),
                                onPressed: () async {
                                  if (isObtainedFromScanner) {
                                    if (widget.taskType == TaskType.hubDrop ||
                                        widget.taskType == TaskType.drop) {
                                      if (barCode == widget.package.barCode) {
                                        goodToGo = true;
                                      } else {
                                        showCustomSnackBar(
                                            context,
                                            Text(
                                                'Package code doesn\'t match previously scanned code at the time of Pickup'));
                                        goodToGo = false;
                                      }
                                    } else {
                                      goodToGo = true;
                                    }
                                  } else if (_codeKey.currentState?.validate() ?? false) {
                                    goodToGo = true;
                                  } else {
                                    goodToGo = false;
                                  }

                                  if (goodToGo) {
                                    bool isScanSuccessful =
                                        (await Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => TakePhotoScreen(
                                                      barcode: _qrTextController.text,
                                                      package: widget
                                                          .package, /*onRefresh: widget.onRefresh*/
                                                    )))) ??
                                            false;
                                    if (isScanSuccessful) {
                                      Navigator.pop(context, true);
                                    }
                                  }
                                },
                                child: Text("Next",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                            24.h
                          ]),
                    ),
                  )
                ]))));
  }
}
