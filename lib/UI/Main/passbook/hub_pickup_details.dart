import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:flutter/material.dart';

class HubPickupDetails extends StatelessWidget {
  const HubPickupDetails({Key? key}) : super(key: key);
  final data = const {
    'name': 'Hemant Sutar',
    'title': 'Customer',
    'delivery_id': '223212',
    'package_image_url':
        'https://www.tinyredbox.com.au/wp-content/uploads/2021/05/TinyRedBox-scaled-e1620823751100-768x577.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hub Pickup'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Scrollbar(
            child: ListView(
              children: [
                sbh(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('20 Jan 2020, 04:00 PM',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    Text('6 Items',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                  ],
                ),
                sbh(16),
                ...List.generate(
                    6,
                    (index) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                  child: Image.network(
                                data['package_image_url']!,
                                fit: BoxFit.cover,
                              )),
                              sbw(12),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  sbh(12),
                                  Text(data['name']!,
                                      style: TextStyle(
                                        fontFamily: 'WorkSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      )),
                                  Text(
                                    '(${data['title']})',
                                    style: TextStyle(
                                        fontFamily: 'WorkSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: GREY5),
                                  ),
                                  sbh(24),
                                  Text('#${data['delivery_id']}',
                                      style: TextStyle(
                                        fontFamily: 'WorkSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      )),
                                  sbh(12),
                                ],
                              )),
                            ],
                          ),
                        )),
              ],
            ),
          ),
        ));
  }
}
