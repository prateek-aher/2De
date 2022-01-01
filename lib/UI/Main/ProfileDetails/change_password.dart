import 'package:delivery/CommonWidget/Snackbar.dart';
import 'package:delivery/Models/change_password_model.dart';
import 'package:delivery/Network/change_password.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late TextEditingController _currentPassword;
  late TextEditingController _newPassword;
  late TextEditingController _confirmPassword;

  GlobalKey<FormState> _form = GlobalKey();

  bool isCurrentVisible = false;
  bool isNewVisible = false;
  @override
  void initState() {
    _currentPassword = TextEditingController();
    _newPassword = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
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
                Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Password',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _currentPassword,
                        maxLength: 50,
                        validator: (v) {
                          return v?.isEmpty ?? true
                              ? 'Insert Current password'
                              : null;
                        },
                        obscureText: !isCurrentVisible,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            suffix: InkWell(
                              child: Icon(!isCurrentVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onTap: () {
                                setState(() {
                                  isCurrentVisible = !isCurrentVisible;
                                });
                              },
                            ),
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
                        controller: _newPassword,
                        maxLength: 50,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (v) {
                          if (v?.isEmpty ?? true) {
                            return 'Insert New password';
                          }
                          if (v!.trim().length < 6) {
                            return 'Atleast 6 characters required';
                          }
                          return null;
                        },
                        obscureText: !isNewVisible,
                        decoration: InputDecoration(
                            suffix: InkWell(
                              child: Icon(!isNewVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onTap: () {
                                setState(() {
                                  isNewVisible = !isNewVisible;
                                });
                              },
                            ),
                            hintText: 'Enter New password here',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            )),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _confirmPassword,
                        maxLength: 50,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (v) {
                          if (v?.isEmpty ?? true) {
                            return 'Insert new password again';
                          }
                          if (_newPassword.text.isEmpty) {
                            return 'Insert new password first';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Retype New password here',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            )),
                      ),
                    ],
                  ),
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
                              onPressed: change, child: Text('Save')))
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

  @override
  void dispose() {
    _currentPassword.dispose();
    _newPassword.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  void change() async {
    ChangePasswordModel? model;
    if (_form.currentState!.validate()) {
      model = await ChangePasswordService.change({
        'current_password': _currentPassword.text.trim(),
        'new_password': _newPassword.text.trim(),
      });
      if ((model?.status?.toLowerCase() ?? '') == 'success') {
        showCustomSnackBar(
                context, Text(model?.data?.result!.message ?? 'Success'))
            .whenComplete(() {
          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pop();
          });
        });
      } else {
        showCustomSnackBar(context, Text(model?.data?.result!.error ?? 'Error'),
            backgroundColor: Colors.red);
      }
    }
  }
}
