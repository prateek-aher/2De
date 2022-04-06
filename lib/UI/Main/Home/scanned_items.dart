import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Providers/FindTaskProvider.dart';
import 'package:delivery/UI/Main/Home/rate_cutomer.dart';
import 'package:delivery/UI/Main/Home/Homepage.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../QRScanScreen.dart';

class ScannedItems extends StatefulWidget {
  const ScannedItems({Key? key}) : super(key: key);

  @override
  State<ScannedItems> createState() => _ScannedItemsState();
}

class _ScannedItemsState extends State<ScannedItems> {
  List<Package> packages = [];
  int scannedNumber = 0;
  @override
  void initState() {
    super.initState();
    packages = context.read<FindTaskProvider>().findTaskModel!.data!.result!.packages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan items'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
              packages.length,
              (index) => InkWell(
                  onTap: packages[index].file != null
                      ? null
                      : () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => QRScanScreen(
                                    package: packages[index],
                                    // onRefresh: () {
                                    //   setState(() {});
                                    // },
                                  )));
                        },
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.3),
                      ),
                      child: packages[index].file == null
                          ? Icon(Icons.add_photo_alternate,
                              size: 48, color: Colors.blueGrey.withOpacity(0.8))
                          : FittedBox(
                              fit: BoxFit.contain, child: Image.file(packages[index].file!))))),
          childAspectRatio: 1,
          shrinkWrap: true,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(color: GREY7, offset: Offset(0, -4), blurRadius: 10, spreadRadius: 0)
          ]),
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: ElevatedButton(
              onPressed: () async {
                packages.forEach((element) {
                  if (element.file != null) {
                    scannedNumber++;
                  }
                });
                if (scannedNumber <= packages.length) {
                  await showDialog(
                      context: context,
                      // barrierColor: const Color(0xffF7F9FB).withOpacity(0.8),
                      barrierColor: Colors.black.withOpacity(0.5),
                      barrierDismissible: true,
                      builder: (context) => AlertDialog(
                            backgroundColor: Colors.white,
                            title: Center(
                                child: Text(
                                    'Some items have not been scanned.\nAre you sure you want to proceed?')),
                            elevation: 8,
                            actions: [
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('NO')),
                              ElevatedButton(
                                  onPressed: () async {
                                    Navigator.of(context).pop();
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) => RateCustomer()));
                                  },
                                  child: Text('YES')),
                            ],
                          ));
                } else {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => RateCustomer()));
                }
              },
              child: Text(
                'Proceed',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ))),
    );
  }
}
