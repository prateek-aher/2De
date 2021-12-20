import 'package:flutter/material.dart';

class BankAccountDetails extends StatelessWidget {
  const BankAccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Bank Account Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Zwei flinke Boxer jagen die quirlige Eva und ihren Mops durch Sylt. Franz jagt im komplett verwahrlosten Taxi quer durch.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 28),
                  Text(
                    'IFSC Code',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    maxLength: 50,
                    decoration: InputDecoration(
                        hintText: 'BSDB78SDFB678SDF6',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                        )),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Account Holder’s Name',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    maxLength: 50,
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
                    decoration: InputDecoration(
                        hintText: 'ankurmisra@ybl',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                        )),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Where Is My UPI ID?',
                        style: TextStyle(fontSize: 16),
                      ))
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.width * 0.05,
              ),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.15,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: OutlinedButton(
                            onPressed: () {}, child: Text('Cancel'))),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Save')))
                  ],
                ),
              ),
            ),
            SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
