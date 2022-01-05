import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';

class ReferAndEarn extends StatefulWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();
}

class _ReferAndEarnState extends State<ReferAndEarn> {
  PhoneContact? contact;
  late TextEditingController _name;
  late TextEditingController _number;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _number = TextEditingController();
  }

  @override
  void dispose() {
    _name.dispose();
    _number.dispose();
    super.dispose();
  }

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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Refer a Delivery Person!',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                  8.h,
                  Text(
                    'Lorem ipsum dolor sit amet, consetetur',
                    style: TextStyle(fontSize: 14),
                  ),
                  24.h,
                  // select from contacts
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.15,
                    child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey[300]!)),
                        onPressed: () async {
                          contact =
                              await FlutterContactPicker.pickPhoneContact();
                          _name.text = contact?.fullName ?? '';
                          final x =
                              contact?.phoneNumber?.number?.split(' ').join() ??
                                  '';
                          _number.text = x.substring(x.length - 10);
                        },
                        icon: Image.asset(
                          'assets/contact.png',
                          height: 20,
                        ),
                        label: Text(
                          'Select from Contacts',
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                  24.h,
                  // divider
                  // Row(
                  //   children: [
                  //     Expanded(child: divider()),
                  //     Text('  OR  '),
                  //     Expanded(child: divider())
                  //   ],
                  // ),
                  // 24.h,
                  // Text(
                  //   'Enter Contacts Manually',
                  //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  // ),
                  // 24.h,
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
                          controller: _name,
                          textCapitalization: TextCapitalization.words,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'required';
                            }
                            if (v.contains(RegExp('^[0-9]\$'))) {
                              return 'Name cannot contain numbers';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]!)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor)),
                              label: Text(
                                'Name',
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
                      // 12.w,
                      // Expanded(
                      //   child: TextFormField(
                      //     keyboardType: TextInputType.text,
                      //     decoration: InputDecoration(
                      //         enabledBorder: UnderlineInputBorder(
                      //             borderSide:
                      //                 BorderSide(color: Colors.grey[300]!)),
                      //         focusedBorder: UnderlineInputBorder(
                      //             borderSide: BorderSide(
                      //                 color: Theme.of(context).primaryColor)),
                      //         label: Text(
                      //           'Last Name',
                      //         ),
                      //         labelStyle: TextStyle(
                      //             fontSize: 20,
                      //             fontWeight: FontWeight.w500,
                      //             color: Colors.black),
                      //         hintText: 'Sharma',
                      //         hintStyle: TextStyle(
                      //             color: Colors.grey[400], fontSize: 20)),
                      //   ),
                      // )
                    ],
                  ),
                  24.h,
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
                        controller: _number,
                        validator: (v) {
                          return v!.isEmpty ? 'required' : null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[300]!)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            prefix: Text('+91 - ',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                            label: Text('Creator Phone Number'),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            hintText: '9876543210',
                            hintStyle: TextStyle(
                                color: Colors.grey[400], fontSize: 20)),
                      )),
                    ],
                  ),
                  24.h,
                  ElevatedButton(
                      onPressed: () {
                        _formKey.currentState?.validate();
                      },
                      child: Text('Refer Now'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
