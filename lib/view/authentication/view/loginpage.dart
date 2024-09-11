import 'package:flutter/material.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.transparent),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            GradientText(
              'MAIN FORD',
              style:
                  const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold,fontFamily: 'Lora'),
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
            Text('Login using your email and password.'),
            Constants.height15,
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: AppColors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.inputFieldBorderColor,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.inputFieldBorderColor,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.inputFieldBorderColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
