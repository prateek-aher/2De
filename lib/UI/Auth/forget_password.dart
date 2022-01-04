import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Providers/SendOtpProvider.dart';
import 'package:delivery/UI/Auth/enter_phone_number.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key, required this.phoneNumber}) : super(key: key);
  final String phoneNumber;

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        centerTitle: true,
        backgroundColor: themeData.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Reach out to your hub or city manager. They will be able to help you with a new password.',
                style: TextStyle(fontSize: 16),
              ),
              36.h,
              Text(
                'Your Hub Manager',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              12.h,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.1,
                      backgroundColor: Colors.grey[300]!,
                      backgroundImage: NetworkImage(
                        'https://www.pinpng.com/pngs/m/341-3416159_no-avatar-pic-user-profile-image-png-transparent.png',
                      ),
                    ),
                    12.w,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            'Mahendra Singh Dhoni',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Text(
                          '+91 9765886434',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.call,
                            color: themeData.primaryColor,
                          ),
                        ))
                  ],
                ),
              ),
              36.h,
              Text(
                'City Manager',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              12.h,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.1,
                      backgroundColor: Colors.grey[300]!,
                      backgroundImage: NetworkImage(
                        'https://www.pinpng.com/pngs/m/341-3416159_no-avatar-pic-user-profile-image-png-transparent.png',
                      ),
                    ),
                    12.w,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            'Suresh Raina',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Text(
                          '+91 9765886434',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.call,
                            color: themeData.primaryColor,
                          ),
                        ))
                  ],
                ),
              ),
              36.h,
              Wrap(
                runAlignment: WrapAlignment.start,
                alignment: WrapAlignment.start,
                spacing: 4,
                children: [
                  RichText(
                      softWrap: true,
                      text: TextSpan(
                        text: 'Is ',
                        style: TextStyle(fontSize: 16, color: BLACK4),
                        children: [
                          TextSpan(
                              text: widget.phoneNumber,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          TextSpan(
                              text: ' not your number?',
                              style: TextStyle(fontSize: 16)),
                        ],
                      )),
                  InkWell(
                    onTap: () async {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EnterPhoneNumber()),
                          (route) => false);
                    },
                    child: Text(
                      'Change here.',
                      style: TextStyle(
                          fontSize: 16, color: themeData.primaryColor),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
