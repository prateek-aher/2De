import 'package:camera/camera.dart';
import 'package:delivery/Providers/FindTaskProvider.dart';
import 'package:delivery/Providers/LoginProvider.dart';
import 'package:delivery/Providers/SendOtpProvider.dart';
import 'package:delivery/Providers/TimeProvider.dart';
import 'package:delivery/Providers/UpdateStatusProvider.dart';
import 'package:delivery/Providers/user_Registration_Provider.dart';
import 'package:delivery/UI/Onbording/splash_screen.dart';
import 'package:delivery/Utils/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

var getCamDescription;
final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  getCamDescription = cameras.first;
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SendOtpProvider>(
            create: (context) => SendOtpProvider()),
        ChangeNotifierProvider<TimeProvider>(
            create: (context) => TimeProvider()),
        ChangeNotifierProvider<UserRegistrationProvider>(
            create: (context) => UserRegistrationProvider()),
        ChangeNotifierProvider<LoginProvider>(
            create: (context) => LoginProvider()),
        ChangeNotifierProvider<FindTaskProvider>(
            create: (context) => FindTaskProvider()),
        ChangeNotifierProvider<UpdateStatusProvider>(
            create: (context) => UpdateStatusProvider())
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: '2De',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Primary_Color,
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  primary: Primary_Color,
                  side: BorderSide(color: Primary_Color))),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(primary: Primary_Color)),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(primary: Primary_Color)),
        ),
        home: const SplashScree(),
      ),
    );
  }
}
