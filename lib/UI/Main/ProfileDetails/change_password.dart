import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

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
            'Change Password',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.width * 0.1),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 28),
                Text(
                  'Current Password',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(
                      hintText: 'Enter Current Password here',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      )),
                ),
                SizedBox(height: 12),
                Text(
                  'New Password',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(
                      hintText: 'Enter new password here',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      )),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'))),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('Save')))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
