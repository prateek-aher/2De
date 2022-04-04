import 'package:delivery/Providers/BagProvider.dart';
import 'package:delivery/Providers/Manager/manager_dashboard_provider.dart';
import 'package:delivery/Providers/Manager/tasklist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/FindTaskProvider.dart';
import 'Providers/LoginProvider.dart';
import 'Providers/SendOtpProvider.dart';
import 'Providers/TimeProvider.dart';
import 'Providers/user_Registration_Provider.dart';
import 'UI/Onbording/splash_screen.dart';
import 'Utils/colors.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SendOtpProvider>(create: (context) => SendOtpProvider()),
        ChangeNotifierProvider<TimeProvider>(create: (context) => TimeProvider()),
        ChangeNotifierProvider<UserRegistrationProvider>(
            create: (context) => UserRegistrationProvider()),
        ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider()),
        ChangeNotifierProvider<FindTaskProvider>(create: (context) => FindTaskProvider()),
        // ChangeNotifierProvider<UpdateStatusProvider>(
        //     create: (context) => UpdateStatusProvider()),
        ChangeNotifierProvider<BagProvider>(create: (context) => BagProvider()),
        ChangeNotifierProvider<TaskListProvider>(create: (context) => TaskListProvider()),
        ChangeNotifierProvider<DashboardProvider>(create: (context) => DashboardProvider()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: '2De',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: PRIMARY_COLOR,
          scaffoldBackgroundColor: SCAFFOLD_BACKGROUND_COLOR,
          appBarTheme: const AppBarTheme(
            backgroundColor: PRIMARY_COLOR,
            centerTitle: true,
            titleTextStyle: TextStyle(fontSize: 20),
            // toolbarHeight: 90,
          ),
          fontFamily: 'Roboto',
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  primary: PRIMARY_COLOR, side: BorderSide(color: PRIMARY_COLOR))),
          elevatedButtonTheme:
              ElevatedButtonThemeData(style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR)),
          textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: PRIMARY_COLOR)),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
