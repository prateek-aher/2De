import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferAndEarn extends StatelessWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF7F9FB),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Refer and Earn',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Refer a Delivery Person!',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                Text(
                  'Lorem ipsum dolor sit amet, consetetur',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 24),
                // select from contacts
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.15,
                  child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey[300]!)),
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/contact.png',
                        height: 20,
                      ),
                      label: Text(
                        'Select from Contacts',
                        style: TextStyle(fontSize: 16),
                      )),
                ),
                SizedBox(height: 24),
                // divider
                Row(
                  children: [
                    Expanded(child: divider()),
                    Text('  OR  '),
                    Expanded(child: divider())
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  'Enter Contacts Manually',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 24),
                // first row
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
                      child: Image.asset(
                        'assets/user.png',
                        height: 25,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[300]!)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            label: Text(
                              'First Name',
                            ),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            hintText: 'Anuradha',
                            hintStyle: TextStyle(
                                color: Colors.grey[400], fontSize: 20)),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[300]!)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            label: Text(
                              'Last Name',
                            ),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            hintText: 'Sharma',
                            hintStyle: TextStyle(
                                color: Colors.grey[400], fontSize: 20)),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 24),
                // second row
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
                      child: Image.asset(
                        'assets/call_rounded.png',
                        height: 25,
                      ),
                    ),
                    Expanded(
                        child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]!)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          prefix: Text(
                            '+91 - ',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          label: Text(
                            'Creator Phone Number',
                          ),
                          labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                          hintText: '9876543210',
                          hintStyle:
                              TextStyle(color: Colors.grey[400], fontSize: 20)),
                    )),
                  ],
                ),
                SizedBox(height: 24),
                ElevatedButton(onPressed: () {}, child: Text('Refer Now'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
// child: Image.asset(
// 'assets/call.png',
// height: 30,
// ),
// ),
// Column(
// children: [
// Text('Creator Phone Number',
// style: TextStyle(
// fontWeight: FontWeight.w500, fontSize: 14)),
// Row(
// children: [
// Text('+91',
// style: TextStyle(
// fontWeight: FontWeight.w500, fontSize: 20)),
// TextFormField(
// decoration: InputDecoration(
// hintText: '9876543210',
// hintStyle: TextStyle(
// fontSize: 20, color: Color(0xffc4c9cd)),
// ),
// )
// ],
// ),
// ],
// ),
// ],
// )
