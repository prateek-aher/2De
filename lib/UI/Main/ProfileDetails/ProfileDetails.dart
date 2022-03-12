import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/UI/Auth/enter_phone_number.dart';
import 'package:delivery/UI/Main/ProfileDetails/bank_account_details.dart';
import 'package:delivery/UI/Main/ProfileDetails/insurance_details.dart';
import 'package:delivery/UI/Main/ProfileDetails/my_documents.dart';
import 'package:delivery/UI/Main/ProfileDetails/my_hub.dart';
import 'package:delivery/UI/Main/ProfileDetails/power_kit.dart';
import 'package:delivery/Utils/constants/endpoints.dart';
import 'package:delivery/Utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'change_password.dart';
import 'my_profile.dart';
import 'refer_and_earn.dart';
import 'vehicle_details.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  String? url;
  String? name;
  String? phoneNumber;

  @override
  void initState() {
    super.initState();
    loadFromPrefs();
  }

  void loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    url = prefs.getString('avatar');
    name = prefs.getString('name');
    phoneNumber = prefs.getString('phone_no');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF7F9FB),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: ListView(children: [
          Container(
            padding: const EdgeInsets.only(top: 40),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Profile avatar
                Container(
                  height: MediaQuery.of(context).size.width * 0.35,
                  child: ClipOval(
                    child: CachedNetworkImage(
                        imageUrl: (url?.contains('no-image') ?? true)
                            ? DUMMY_USER_AVATAR_URL
                            : BASE_URL + (url ?? '/'),
                        errorWidget: (_, __, ___) =>
                            Image.asset('assets/dummy_user.png')),
                  ),
                ),
                20.h,
                // Name
                Text(
                  '$name',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                6.h,
                Text('$phoneNumber',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16)),
                16.h,
              ],
            ),
          ),
          24.h,
          ProfileDetailsTile(
              icon: 'assets/money_bag.png',
              title: 'Bank Account Details',
              subTitle:
                  'Enter your bank account details here to receive your payment when you withdraw.',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BankAccountDetails()));
              }),
          divider(),
          ProfileDetailsTile(
              icon: 'assets/people.png',
              title: 'Refer and Earn',
              subTitle: 'Refer a friend for delivery services.',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReferAndEarn()));
              }),
          divider(),
          ProfileDetailsTile(
              iconWidget: Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              (url?.contains('no-image') ?? true)
                                  ? DUMMY_USER_AVATAR_URL
                                  : BASE_URL + (url ?? '/')),
                          fit: BoxFit.contain))),
              title: 'My Profile',
              subTitle: 'Find your personal information here.',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyProfile()));
              }),
          divider(),
          ProfileDetailsTile(
              icon: 'assets/hub.png',
              title: 'My Hub',
              subTitle: 'Find information of your hub and its manager.',
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyHub()));
              }),
          divider(),
          ProfileDetailsTile(
              icon: 'assets/helmet.png',
              title: 'Power Kit',
              subTitle: 'Request and find status of your delivery kit.',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PowerKit()));
              }),
          divider(),
          ProfileDetailsTile(
              icon: 'assets/heart_done.png',
              title: 'Insurance Details',
              subTitle: 'Find details of your insurance here.',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InsuranceDetails()));
              }),
          divider(),
          ProfileDetailsTile(
              icon: 'assets/certified.png',
              title: 'My Documents',
              subTitle: 'Aadhaar card, Pan Card and Driving License',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyDocuments()));
              }),
          divider(),
          ProfileDetailsTile(
              icon: 'assets/scooter.png',
              title: 'Vehicle Details',
              subTitle: 'Vehicle pictures, vehicle insurance, PUC',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VehicleDetails()));
              }),
          divider(),
          ProfileDetailsTile(
              icon: 'assets/locale.png',
              title: 'Change Language',
              subTitle: 'Select your account language here.',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Coming soon...'),
                  backgroundColor: Theme.of(context).primaryColor,
                ));
              }),
          divider(),
          ProfileDetailsTile(
              icon: 'assets/secure_shield.png',
              title: 'Change Password',
              subTitle: 'Change you account passwords here.',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangePassword()));
              }),
          divider(),
          ProfileDetailsTile(
            icon: 'assets/power.png',
            title: 'Logout',
            subTitle: 'Click here to logout of your account.',
            onTap: () async {
              await showDialog(
                  context: context,
                  // barrierColor: const Color(0xffF7F9FB).withOpacity(0.8),
                  barrierColor: Colors.black.withOpacity(0.5),
                  barrierDismissible: true,
                  builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        title: Center(
                            child: Text('Are you sure you want to logout?')),
                        elevation: 8,
                        actions: [
                          OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('NO')),
                          ElevatedButton(
                              onPressed: () async {
                                showLoading();
                                SharedPreferences _prefs =
                                    await SharedPreferences.getInstance();
                                _prefs.remove('token');
                                hideLoading();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EnterPhoneNumber()),
                                    (route) => false);
                              },
                              child: Text('YES')),
                        ],
                      ));
            },
          ),
          24.h,

          // Footer
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.width * 0.055),
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bulb and key Helpline Number',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    24.h,
                    Text(
                        'Give us a call on the following number. Our representative will be able to solve the issue.',
                        style: TextStyle(fontSize: 14)),
                    24.h,
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffe2e4e6)),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(children: [
                          8.w,
                          Image.asset('assets/call_rounded.png',
                              height: 25, color: Colors.grey),
                          16.w,
                          Text('+91 9457294363',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          Spacer(),
                          TextButton(
                              onPressed: () async {
                                await launch('tel:+91 9457294363');
                              },
                              child: Text('Call Us',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)))
                        ]))
                  ])),
          (MediaQuery.of(context).size.width * 0.7).h,
        ]));
  }
}

class ProfileDetailsTile extends StatelessWidget {
  const ProfileDetailsTile(
      {Key? key,
      this.icon,
      required this.title,
      required this.subTitle,
      this.iconWidget,
      this.onTap})
      : super(key: key);
  final String? icon;
  final Widget? iconWidget;
  final String title;
  final String subTitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: 110,
            color: Colors.white,
            child: Row(children: [
              iconWidget ??
                  Container(
                      height: 45,
                      width: 45,
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffe2e4e6)),
                          borderRadius: BorderRadius.circular(8)),
                      child: icon != null ? Image.asset(icon!) : SizedBox()),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    4.h,
                    Text(subTitle,
                        style: TextStyle(fontSize: 12, color: Colors.grey))
                  ])),
              Container(
                  height: 45,
                  width: 45,
                  child: Icon(Icons.arrow_forward_ios,
                      color: Theme.of(context).primaryColor))
            ])));
  }
}
