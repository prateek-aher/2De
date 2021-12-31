import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:flutter/material.dart';

class PickupDetails extends StatelessWidget {
  const PickupDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pickup Details'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              sbh(24),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: 'Hemant Sutar' + ' ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: '(Creator)',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: BLACK3)),
                ]),
              ),
              sbh(12),
              Text('#223212',
                  style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              sbh(12),
              Text(
                '20 Jan 2020, 04:00 PM',
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: BLACK4),
              ),
              sbh(8),
              // package image
              Container(
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.3,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://www.fedex.com/content/dam/fedex/us-united-states/FedEx-Office/images/2021/q1/P03110_FY20FDMLP_SignforPackagesImage_727x463.jpg',
                        ),
                        fit: BoxFit.cover)),
              ),
              sbh(24),
              buildDetailRow(left: 'Amount Awarded ', right: '\u20b915'),
              sbh(6),
              buildDetailRow(left: 'Closing Balance ', right: '\u20b93400'),
              sbh(6),
              buildDetailRow(
                  left: 'Pickup Assigned at ', right: '20 Jan 2020, 05:00 PM'),
              sbh(6),
              buildDetailRow(
                  left: 'Arrived at location ', right: '20 Jan 2020, 05:00 PM'),
              sbh(6),
              buildDetailRow(
                  left: 'Pickup Completed at ', right: '20 Jan 2020, 05:00 PM'),
            ],
          ),
        ));
  }

  Row buildDetailRow({String? left, String? right}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(left ?? '',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
        ),
        // Spacer(),
        Expanded(
          child: Text(right ?? '',
              textAlign: TextAlign.end, style: TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}
