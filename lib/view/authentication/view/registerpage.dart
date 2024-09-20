import 'package:flutter/material.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/authentication/view/loginpage.dart';
import 'package:main_ford/view/authentication/widgets/custombutton.dart';
import 'package:main_ford/view/authentication/widgets/customtextfield.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.transparent),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Center(
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
                const Text(
                  'Submit your information to request access. Please note, your login will be enabled once the admin approves your request.',
                  style: MyTextStyles.descSmall,
                ),
                Constants.height10,
                Form(
                  child: Column(
                    children: [
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        text: 'Name',
                        controller: nameController,
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                        text: 'Email',
                        controller: emailController,
                      ),
                      CustomTextField(
                        text: 'Date of Birth',
                        controller: dateController,
                        keyboardType: TextInputType.none,
                        onTap: () async {
                          final DateTime? picked=await showDatePicker(context: context, firstDate: DateTime(1990), lastDate: DateTime.now());
                          if (picked!=null) {
                            
                          }
                        },
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.phone,
                        text: 'Phone Number',
                        controller: phoneController,
                      ),
                      // Container(
                      //   margin: const EdgeInsets.symmetric(vertical: 20),
                      //   width: double.infinity,
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       foregroundColor: AppColors.white,
                      //       backgroundColor: AppColors.tileColor,
                      //       padding: const EdgeInsets.symmetric(
                      //         horizontal: 25,
                      //         vertical: 20,
                      //       ),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15),
                      //       ),
                      //     ),
                      //     onPressed: () {},
                      //     child: const Text('Request'),
                      //   ),
                      // ),
                      CustomElButton(text: 'Request', onPressed: (){})
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const LoginPage()));
                  },
                  child: const Text('If you already have an account LOGIN.'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    dateController.dispose();
    phoneController.dispose();
  }
}
