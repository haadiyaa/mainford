import 'package:flutter/material.dart';
import 'package:main_ford/controller/authprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/appvalidators.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/authentication/view/registerpage.dart';
import 'package:main_ford/view/view/authentication/widgets/custombutton.dart';
import 'package:main_ford/view/view/authentication/widgets/customtextfield.dart';
import 'package:main_ford/view/view/authentication/widgets/forgotdialog.dart';
import 'package:main_ford/view/view/home/view/homepage.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final key = GlobalKey<FormState>();

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
                key: key,
                child: Column(
                  children: [
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      text: 'Email',
                      validator: (value) {
                        return AppValidators().emailValidator(value: value);
                      },
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passController,
                      text: 'Password',
                      validator: (value) {
                        return AppValidators().passwordValidator(value: value);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.white.withOpacity(0.7),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => ForgotPasswordDialog(),
                            );
                          },
                          child: const Text('Forgot Password?'),
                        ),
                      ],
                    ),
                    CustomElButton(
                      text: 'LOGIN',
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.loading,
                            text: "Please wait",
                          );
                          authProvider
                              .loginUser(
                                  email: emailController.text.trim(),
                                  password: passController.text.trim())
                              .then(
                            (value) {
                              Navigator.pop(context);
                              if (authProvider.status == Status.login) {
                                QuickAlert.show(
                                    confirmBtnColor: AppColors.bgColor,
                                    context: context,
                                    type: QuickAlertType.success,
                                    text: 'Login Successful!',
                                    onConfirmBtnTap: () {
                                      Navigator.pop(context);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const HomePage()));
                                    });
                              }
                              if (authProvider.status == Status.loginFailed) {
                                QuickAlert.show(
                                  confirmBtnColor: AppColors.bgColor,
                                  context: context,
                                  type: QuickAlertType.error,
                                  text: authProvider.msg,
                                );
                              }
                            },
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
              Constants.height10,
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const RegisterPage()));
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "If you don’t have an account, ",
                      ),
                      TextSpan(
                        text: "Register here.",
                        style: TextStyle(
                          color: Color.fromARGB(255, 223, 193, 102),
                        ),
                      ),
                    ],
                  ),
                ),
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
