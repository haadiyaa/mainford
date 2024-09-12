import 'package:flutter/material.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/authentication/view/registerpage.dart';
import 'package:main_ford/view/authentication/widgets/custombutton.dart';
import 'package:main_ford/view/authentication/widgets/customtextfield.dart';
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
                      controller: emailController,
                      text: 'Email',
                    ),
                    CustomTextField(
                      controller: passController,
                      text: 'Password',
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.white,
                          backgroundColor: AppColors.tileColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ),
                    // CustomElButton(text: 'text')
                  ],
                ),
              ),
              Constants.height10,
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const RegisterPage()));
                },
                child: const Text(
                    "If you don’t have an account, request to Login here."),
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
