import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Providers/SendOtpProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

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
              Text(
                'Entered wrong Phone Number?',
                style: TextStyle(fontSize: 16),
              ),
              InkWell(
                onTap: () async {
                  String number = '';
                  GlobalKey<FormState> dialogForm = GlobalKey<FormState>();
                  await showDialog(
                      context: context,
                      barrierColor: const Color(0xffF7F9FB).withOpacity(0.5),
                      barrierDismissible: true,
                      builder: (context) => AlertDialog(
                            backgroundColor: Colors.white,
                            title: Container(
                              height: 80,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Phone Number'),
                                  Expanded(
                                    child: Form(
                                      key: dialogForm,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.length == 0 || value == '')
                                            return '*';
                                          if (value.length < 10)
                                            return 'Invalid number';
                                        },
                                        onChanged: (value) {
                                          number = value;
                                        },
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(10),
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        keyboardType: TextInputType.phone,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      themeData.primaryColor)),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red)),
                                          hintText: '9876543210',
                                          hintStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('CANCEL')),
                              ElevatedButton(
                                  onPressed: () {
                                    if (dialogForm.currentState!.validate()) {
                                      Provider.of<SendOtpProvider>(context)
                                          .phoneNum = number;
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: Text('SUBMIT')),
                            ],
                            actionsAlignment: MainAxisAlignment.center,
                          ));
                },
                child: Text(
                  'Click here to Change Phone Number!',
                  style: TextStyle(fontSize: 16, color: themeData.primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
