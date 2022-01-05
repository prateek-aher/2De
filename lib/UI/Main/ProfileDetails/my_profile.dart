import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Models/my_profile_model.dart';
import 'package:delivery/Network/get_profile.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  MyProfileModel? _model;
  @override
  void initState() {
    super.initState();
    getModel();
  }

  void getModel() async {
    _model = await ProfileService.getProfile();
    setState(() {});
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
            'My Profile',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            // width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'To edit this information, contact your hub supervisor.',
                    maxLines: 1,
                  ),
                ),
                4.h,
                ...profileEntry(
                    title: 'Name', value: _model?.data?.result?.name ?? ''),
                divider(),
                ...profileEntry(
                    title: 'Phone Number',
                    value: _model?.data?.result?.phoneNo ?? ''),
                divider(),
                ...profileEntry(
                    title: 'Email address',
                    value: _model?.data?.result?.email ?? ''),
                divider(),
                ...profileEntry(
                    title: 'Onboarded on',
                    value:
                        _model?.data?.result?.onboardDate?.split(',').first ??
                            ''),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Iterable<Widget> profileEntry(
          {required String title, required String value}) =>
      [
        20.h,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Text(
              value,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
        20.h,
      ];
}
