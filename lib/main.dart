import 'package:flutter/material.dart';
import 'package:main_ford/view/view/home/view/homepage.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/mytextstyles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const HomePage(),
    );
  }
}
