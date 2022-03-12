import 'package:flutter/material.dart';
import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class BankAccountDetails extends StatefulWidget {
  BankAccountDetails({Key? key}) : super(key: key);

  @override
  State<BankAccountDetails> createState() => _BankAccountDetailsState();
}

class _BankAccountDetailsState extends State<BankAccountDetails> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _ifsc;
  late TextEditingController _name;
  late TextEditingController _branch;
  late TextEditingController _type;
  late TextEditingController _upi;

  @override
  void initState() {
    super.initState();
    _ifsc = TextEditingController();
    _name = TextEditingController();
    _branch = TextEditingController();
    _type = TextEditingController();
    _upi = TextEditingController();
  }

  @override
  void dispose() {
    _ifsc.dispose();
    _name.dispose();
    _branch.dispose();
    _type.dispose();
    _upi.dispose();
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
            'Bank Account Details',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.1),
                color: Colors.white,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Bank Account Details',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      12.h,
                      Text(
                        'Zwei flinke Boxer jagen die quirlige Eva und ihren Mops durch Sylt. Franz jagt im komplett verwahrlosten Taxi quer durch.',
                        style: TextStyle(fontSize: 14),
                      ),
                      28.h,
                      Text(
                        'IFSC Code',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        maxLength: 11,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'required';
                          }
                          if (!RegExp('^[A-Z]{4}0[A-Z0-9]{6}\$').hasMatch(v)) {
                            return 'IFSC code is invalid';
                          }
                          return null;
                        },
                        textCapitalization: TextCapitalization.characters,
                        decoration: InputDecoration(
                            hintText: 'PUNB0902838',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            )),
                      ),
                      12.h,
                      Text(
                        'Account Holder’s Name',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        maxLength: 50,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'required';
                          }
                          if (v.contains(RegExp('[0-9]'))) {
                            return 'Name cannot contain numbers';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                            hintText: 'Ankush Misra',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            )),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Branch Name',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        maxLength: 50,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'required';
                          }
                          if (v.contains(RegExp('[0-9]'))) {
                            return 'Name cannot contain numbers';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                            hintText: 'Baner, Pune',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            )),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Select Account Type',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        maxLength: 50,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'required';
                          }
                          if (v.contains(RegExp('[0-9]'))) {
                            return 'Type cannot contain numbers';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.datetime,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                            hintText: 'Savings',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            )),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Enter your UPI ID',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        maxLength: 50,
                        validator: (v) {
                          if (v!.isNotEmpty &&
                              !RegExp('^[a-z0-9]@[a-z]\$').hasMatch(v)) {
                            return 'invalid UPI id';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        decoration: InputDecoration(
                            hintText: 'ankurmisra@ybl',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            )),
                      ),
                      TextButton(
                          onPressed: () async {
                            await launch(
                                'https://payu.in/blog/how-to-find-upi-id-across-different-payment-platforms/');
                          },
                          child: Text(
                            'Where Is My UPI ID?',
                            style: TextStyle(fontSize: 16),
                          ))
                    ],
                  ),
                ),
              ),
              24.h,
              Container(
                color: Colors.white,
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'))),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                _formKey.currentState?.validate();
                              },
                              child: Text('Save')))
                    ],
                  ),
                ),
              ),
              200.h,
            ],
          ),
        ),
      ),
    );
  }
}
