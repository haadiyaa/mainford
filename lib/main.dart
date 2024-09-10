import 'package:flutter/material.dart';
import 'package:main_ford/view/home/view/homepage.dart';
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
        textTheme: Typography.whiteCupertino,
        scaffoldBackgroundColor: AppColors.bgColor,
        appBarTheme: AppBarTheme(
          toolbarTextStyle: MyTextStyles.appBartextSmall,
          backgroundColor: AppColors.bgColor,
          titleTextStyle: MyTextStyles.appBartext
        )
      ),
      home:const HomePage(),
    );
  }
}
