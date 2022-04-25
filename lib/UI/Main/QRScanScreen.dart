import 'dart:io';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Providers/Manager/task_details_provider.dart';
import 'package:delivery/UI/Main/TakePhoto.dart';
import 'package:delivery/Utils/enumerations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// ignore: must_be_immutable
class QRScanScreen extends StatefulWidget {
  QRScanScreen({
    Key? key,
    required this.package,
    /*this.onRefresh*/
  }) : super(key: key);
  final Package package;
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
  Barcode? qrResultCode;
  QRViewController? controller;

  bool scannerResult = false;
  late final TaskType _taskType;

  @override
  void initState() {
    _qrTextController = TextEditingController();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _taskType = context.read<TaskDetailsProvider>().taskType;
    });
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
        // qrResultCode = scanData;
        // TODO: Implement to accept not just any code
        _qrTextController.text = scanData.code;
        widget.package.barCode = _qrTextController.text;
        showScanner = false;
        scannerResult = true;
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
                              visible: scannerResult,
                              child: Column(
                                children: [
                                  Text("Package code",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                  12.h,
                                  Text(
                                    widget.package.barCode,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: !scannerResult,
                              child: Form(
                                key: _codeKey,
                                child: TextFormField(
                                    validator: (v) {
                                      if (v?.isEmpty ?? false) {
                                        return 'Package code needed';
                                      }
                                      return null;
                                    },
                                    controller: _qrTextController,
                                    textCapitalization: TextCapitalization.characters,
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
                                  if (scannerResult) {
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
                                  } else if (_codeKey.currentState?.validate() ?? false) {
                                    widget.package.barCode = _qrTextController.text;
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
