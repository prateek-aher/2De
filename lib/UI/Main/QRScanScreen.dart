import 'dart:io';
import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/UI/Main/TakePhoto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({Key? key}) : super(key: key);

  @override
  _QRScanScreenState createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  late final TextEditingController _qrTextController;
  final GlobalKey _qrKey = GlobalKey(
    debugLabel: 'QR',
  );
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
        leading: sbh(0),
        backgroundColor: Colors.white,
        title: Text(
          "Scan QR",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              sbh(12),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: QRView(key: _qrKey, onQRViewCreated: _onQRViewCreated),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    sbh(24),
                    Text(
                      "Enter Code Manually",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    TextFormField(
                      controller: _qrTextController,
                      decoration: InputDecoration(
                          hintText: 'Enter code here',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[400],
                          )),
                    ),
                    sbh(24),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16)),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => TakePhotoScreen()));
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    // sbh(24)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
