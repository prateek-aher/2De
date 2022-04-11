import 'dart:io';

import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/UI/Main/TakePhoto.dart';
import 'package:flutter/material.dart';
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
  final GlobalKey _qrKey = GlobalKey(
    debugLabel: 'QR',
  );
  final _codeKey = GlobalKey<FormState>();
  Barcode? qrResultCode;
  QRViewController? controller;

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
        qrResultCode = scanData;
        // TODO: Implement to accept not just any code
        if (qrResultCode != null) {
          _qrTextController.text = qrResultCode?.code ?? '';
        }
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(children: [
                  12.h,
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: QRView(key: _qrKey, onQRViewCreated: _onQRViewCreated)),
                  Expanded(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        24.h,
                        Text("Enter Code Manually",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Form(
                          key: _codeKey,
                          child: TextFormField(
                              validator: (v) {
                                if (v?.isEmpty ?? false) {
                                  return 'Package code needed';
                                }
                              },
                              controller: _qrTextController,
                              textCapitalization: TextCapitalization.characters,
                              decoration: InputDecoration(
                                  hintText: 'Enter code here',
                                  hintStyle: TextStyle(fontSize: 20, color: Colors.grey[400]))),
                        ),
                        24.h,
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16)),
                            onPressed: () async {
                              if (_codeKey.currentState?.validate() ?? false) {
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
                      ]))
                ]))));
  }
}
