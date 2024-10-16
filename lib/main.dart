import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:main_ford/controller/authprovider.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/authentication/widgets/custombutton.dart';
import 'package:main_ford/view/view/splash/view/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FunctionsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          textTheme: Typography.whiteCupertino.apply(fontFamily: 'Poppins'),
          scaffoldBackgroundColor: AppColors.bgColor,
          appBarTheme: const AppBarTheme(
            toolbarTextStyle: MyTextStyles.appBartextSmall,
            backgroundColor: AppColors.bgColor,
            titleTextStyle: MyTextStyles.appBartext,
            iconTheme: IconThemeData(
              color: AppColors.white,
            ),
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}

class MyConnectionCheck extends StatefulWidget {
  const MyConnectionCheck({super.key});

  @override
  State<MyConnectionCheck> createState() => _MyConnectionCheckState();
}

class _MyConnectionCheckState extends State<MyConnectionCheck> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  showDialogBox() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppColors.bgColor,
          title: const Text('No Connection'),
          content: const Text('Please check your Internet Connection'),
          actions: [
            CustomElButton(
              text: 'Okay',
              onPressed: () async {
                Navigator.pop(context);
                setState(() {
                  isAlertSet = false;
                });
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected) {
                  showDialogBox();
                  setState(() {
                    isAlertSet = true;
                  });
                }
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }

  getConnectivity() => subscription =
          Connectivity().onConnectivityChanged.listen((result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox();
          setState(() {
            isAlertSet = true;
          });
        }
      });
}
