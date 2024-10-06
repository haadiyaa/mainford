import 'package:flutter/material.dart';
import 'package:main_ford/controller/authprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/authentication/view/registerpage.dart';
import 'package:main_ford/view/view/authentication/widgets/custombutton.dart';
import 'package:main_ford/view/view/home/view/homepage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminApprovePage extends StatefulWidget {
  const AdminApprovePage({super.key});

  @override
  State<AdminApprovePage> createState() => _AdminApprovePageState();
}

class _AdminApprovePageState extends State<AdminApprovePage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please wait until you get admin approval!',
                style: MyTextStyles.appBartext,
              ),
              CustomElButton(
                text: "Retry",
                onPressed: () {
                  authProvider.checkStatus().then(
                    (value) async{
                      var sharedPref=await SharedPreferences.getInstance();
                      bool? adminApproved=sharedPref.getBool(Constants.adminApproved);
                      if (adminApproved == null) {
                        print('adminapproved ${null}');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const RegisterPage()));
                      } else {
                        if (adminApproved) {
                          print(' adminapproved ${true}');
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomePage()));
                        } else {
                          print('adminapproved ${false}');
                        }
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
