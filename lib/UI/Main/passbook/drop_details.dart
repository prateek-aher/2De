import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:flutter/material.dart';

class DropDetails extends StatelessWidget {
  const DropDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop details'),
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
                        'https://us.123rf.com/450wm/kchung/kchung1706/kchung170600676/80865035-black-3d-rendering-blank-square-box-with-separate-lid-isolated-gray-background.jpg?ver=6',
                      ),
                      fit: BoxFit.cover)),
            ),
            sbh(24),
            buildDetailRow(left: 'Amount Awarded ', right: '\u20b915'),
            sbh(12),
            buildDetailRow(left: 'Time-Bound bonus ', right: '\u20b922'),
            sbh(12),
            buildDetailRow(left: 'Closing Balance ', right: '\u20b93400'),
            sbh(12),
            buildDetailRow(left: 'Cash Collected ', right: '\u20b92000'),
            sbh(12),
            buildDetailRow(
                left: 'Drop Assigned at ', right: '20 Jan 2020, 05:00 PM'),
            sbh(12),
            buildDetailRow(
                left: 'Arrived at location ', right: '20 Jan 2020, 05:00 PM'),
            sbh(12),
            buildDetailRow(
                left: 'Drop Completed at ', right: '20 Jan 2020, 05:00 PM'),
          ],
        ),
      ),
    );
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
