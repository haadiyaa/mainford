import 'package:flutter/material.dart';
import 'package:main_ford/controller/authprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/authentication/view/registerpage.dart';
import 'package:main_ford/view/view/authentication/widgets/custombutton.dart';
import 'package:main_ford/view/view/home/view/homepage.dart';
import 'package:provider/provider.dart';

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
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please wait until you get admin approval!',
                style: MyTextStyles.appBartext,
              ),
              CustomElButton(
                text: "Retry",
                onPressed: () {
                  authProvider.checkStatus().then(
                    (value) {
                      if (authProvider!.requested == null) {
                        print(null);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const RegisterPage()));
                      } else {
                        if (authProvider!.requested!) {
                          print(true);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomePage()));
                        } else {
                          print(false);
                          // Navigator.pushrep(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => const AdminApprovePage()));
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
