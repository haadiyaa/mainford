import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:main_ford/controller/authprovider.dart';
import 'package:main_ford/view/view/home/view/homepage.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context).checkStatus();
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        childWidget: const Center(
          child: Text('splash'),
        ),
        onAnimationEnd: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => HomePage(),
            ),
          );
        },
      ),
    );
  }
}
