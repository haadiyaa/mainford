import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:main_ford/controller/authprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/view/view/authentication/view/adminapprove.dart';
import 'package:main_ford/view/view/authentication/view/registerpage.dart';
import 'package:main_ford/view/view/home/view/homepage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        backgroundColor: AppColors.bgColor,
        childWidget: Center(
          child: SizedBox(
            width: size.width * 0.7,
            child: const Image(
              image: AssetImage(Constants.mfNoBg),
            ),
          ),
        ),
        onAnimationEnd: () async {
          var sharedPref = await SharedPreferences.getInstance();
          bool? adminapprove = sharedPref.getBool(Constants.adminApproved);
          if (adminapprove == null) {
            print('adminapproved splash null');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const RegisterPage()));
          } else {
            if (adminapprove) {
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
