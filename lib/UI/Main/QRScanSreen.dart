import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({Key? key}) : super(key: key);

  @override
  _QrScanScreenState createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  final TextEditingController _qrTextController = TextEditingController();
  final GlobalKey _qrKey = GlobalKey(
    debugLabel: 'QR',
  );
  Barcode? qrResultCode;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
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
        if (qrResultCode != null) {
          _qrTextController.text = qrResultCode!.code;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Scan Qrcode",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(key: _qrKey, onQRViewCreated: _onQRViewCreated),
          ),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(child: Text("Enter Code Manually")),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: _qrTextController,
                        decoration:
                            InputDecoration(hintText: "Enter Code Manually")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Next")],
                        )),
                  )
                ],
              )
              // Center(
              //   child: (result != null)
              //       ? Text(
              //           'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
              //       : Text('Scan a code'),
              // ),
              )
        ],
      ),
    );
  }
}
