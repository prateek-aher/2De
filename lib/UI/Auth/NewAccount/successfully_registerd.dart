import 'package:delivery/Utils/AppConstant.dart';
import 'package:flutter/material.dart';

class SuccesfullyResgestered extends StatelessWidget {
  const SuccesfullyResgestered({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Registered Successfully!',
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline5!.fontSize),
          )
        ]),
        const Padding(
          padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
          child: Text(
            'Next Steps',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 4)
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Step 1:\t Collect Documents",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  textTile("Orignal Adhar Card"),
                  textTile("Pan Card"),
                  textTile("Delivery Vehicle"),
                  textTile("Vehicle Document(RC, Insurance, POC)"),
                ],
              ),
            )
          ],
        ),
        Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 4)
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Step 2:\t Visit hub between 9am to 5 pm",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Address_of_document_Verification,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    )));
  }

  Widget textTile(String info) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
          Text(
            info,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
