import 'package:flutter/material.dart';
import 'package:main_ford/controller/authprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/authentication/view/adminapprove.dart';
import 'package:main_ford/view/view/authentication/view/registerpage.dart';
import 'package:main_ford/view/view/authentication/widgets/custombutton.dart';
import 'package:main_ford/view/view/authentication/widgets/customtextfield.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.transparent),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GradientText(
                'MAIN FORD',
                style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lora'),
                gradientType: GradientType.linear,
                gradientDirection: GradientDirection.ttb,
                radius: 4,
                colors: const [
                  Color.fromARGB(255, 255, 188, 53),
                  Color(0xffF2E689),
                  Color.fromARGB(255, 255, 162, 0),
                ],
              ),
              Constants.height10,
              const Text(
                'Login using your email and password.',
                style: MyTextStyles.descSmall,
              ),
              Constants.height15,
              Form(
                child: Column(
                  children: [
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      text: 'Email',
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passController,
                      text: 'Password',
                    ),
                    CustomElButton(
                      text: 'LOGIN',
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Constants.height10,
              GestureDetector(
                onTap: () {
                  if (authProvider.requested == null) {
                    print(null);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const RegisterPage()));
                  } else {
                    if (authProvider.requested!) {
                      print(true);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RegisterPage()));
                    } else {
                      print(false);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AdminApprovePage()));
                    }
                  }
                },
                child: const Text("If you don’t have an account, request to Login here."),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }
}
