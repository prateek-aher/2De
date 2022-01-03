import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Utils/endpoints.dart';
import 'package:flutter/material.dart';

class SuccessfullyRegistered extends StatelessWidget {
  const SuccessfullyRegistered({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      children: [
        15.h,
        Text(
          'Registered Successfully',
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline5!.fontSize,
              fontWeight: FontWeight.w500),
        ),
        18.h,
        Text(
          'Next Steps',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        12.h,
        Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
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
                  Text(
                    "Step 1:\t Collect Documents",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  12.h,
                  Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut',
                      style: TextStyle(fontSize: 14)),
                  12.h,
                  textTile("Orignal Adhar Card"),
                  textTile("Pan Card"),
                  textTile("Delivery Vehicle"),
                  textTile("Vehicle Document(RC, Insurance, POC)"),
                ],
              ),
            ),
            12.h,
            Container(
              // margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
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
                  Text(
                    "Step 2:\t Visit our hub between 9am to 5 pm",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  12.h,
                  Text(
                    DOCUMENT_VERIFICATION_ADDRESS,
                    style: TextStyle(fontSize: 14),
                  ),
                  24.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.call),
                        label: Text(
                          'Call',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(16)),
                      ),
                      12.w,
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.navigation),
                        label: Text('Navigate',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(16)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            12.h,
            Container(
              // margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
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
                  Text(
                    "Step 3:\t Verify Documents",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  12.h,
                  Text(
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut',
                    style: TextStyle(fontSize: 14),
                  ),
                  18.h,
                  Text(
                    'Contact Person',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  12.h,
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.1,
                            backgroundColor: Colors.grey[300]!,
                            child: Image.network(
                              'https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/avat-01-512.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mahendra Singh Dhoni',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                '+91 9765886434',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(width: 12),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[300]!),
                                  borderRadius: BorderRadius.circular(8)),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.call,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            48.h,
          ],
        ),
      ],
    )));
  }

  Widget textTile(String info) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
          Expanded(
            child: Text(
              info,
              // maxLines: 2,
              style: TextStyle(
                  // overflow: TextOverflow.fade,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
