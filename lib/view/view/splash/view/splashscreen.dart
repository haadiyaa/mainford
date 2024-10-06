import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:main_ford/controller/authprovider.dart';
import 'package:main_ford/view/view/authentication/view/adminapprove.dart';
import 'package:main_ford/view/view/authentication/view/registerpage.dart';
import 'package:main_ford/view/view/home/view/homepage.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.checkStatus();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context,
        listen: false); // authProvider!.checkStatus();
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        childWidget: const Center(
          child: Text('splash'),
        ),
        onAnimationEnd: () {
          if (authProvider.adminApproved == null) {
            print('adminapproved splash null');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const RegisterPage()));
          } else {
            if (authProvider.adminApproved!) {
              print('adminapproved splash true');
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const HomePage()));
            } else {
              print('adminapproved splash false');
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AdminApprovePage()));
            }
          }
        },
      ),
    );
  }
}
