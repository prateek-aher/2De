import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Providers/FindTaskProvider.dart';
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

  @override
  void initState() {
    super.initState();
    packages =
        context.read<FindTaskProvider>().findTaskModel!.data!.result!.packages;
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
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QRScanScreen()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(0.3),
                        ),
                        child: Icon(Icons.add_photo_alternate,
                            size: 48,
                            color: Colors.blueGrey.withOpacity(0.8))))),
            childAspectRatio: 1,
            shrinkWrap: true,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
        ));
  }
}
