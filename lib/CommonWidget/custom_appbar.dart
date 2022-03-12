import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery/Providers/SosProvider.dart';
import 'package:delivery/UI/Main/Home/help.dart';
import 'package:delivery/UI/Main/passbook/PassBook.dart';
import 'package:delivery/UI/Main/ProfileDetails/ProfileDetails.dart';
import 'package:delivery/Utils/constants/endpoints.dart';
import 'package:delivery/Utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55);
}

class _CustomAppBarState extends State<CustomAppBar> {
  String? url;

  @override
  void initState() {
    super.initState();
    loadAvatar();
  }

  loadAvatar() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    url = _pref.getString('avatar');
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileDetails()));
        },
        icon: Hero(
          tag: 'profilepicture',
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: (url?.contains('no-image') ?? true)
                  ? DUMMY_USER_AVATAR_URL
                  : BASE_URL + (url ?? '/'),
              errorWidget: (_, __, ___) => Image.asset('assets/dummy_user.png'),
            ),
          ),
        ),
      ),
      title: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Passbook()));
        },
        child: Container(
          height: 45,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: Text('\u20b90',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'WorkSans',
                  fontSize: 20,
                  color: Colors.black)),
        ),
      ),
      centerTitle: true,
      actions: [
        TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 24))),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                          create: (BuildContext context) => SosProvider(),
                          child: Help())));
            },
            child: Text(
              "Help!",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
        // Text('     ')
      ],
    );
  }
}
