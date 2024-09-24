import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/bloc/bloc/auth_bloc.dart';
import 'package:main_ford/view/view/authentication/view/loginpage.dart';
import 'package:main_ford/view/view/authentication/widgets/custombutton.dart';
import 'package:main_ford/view/view/authentication/widgets/customtextfield.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RegisterPageWrapper extends StatelessWidget {
  const RegisterPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const RegisterPage(),
    );
  }
}

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
  final TextEditingController codeController = TextEditingController();
  final key = GlobalKey<FormState>();
  File? selectedImage;

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
                  key: key,
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
                        keyboardType: TextInputType.phone,
                        text: 'Phone Number',
                        controller: phoneController,
                      ),
                      CustomTextField(
                        text: 'Date of Birth',
                        controller: dateController,
                        keyboardType: TextInputType.none,
                        onTap: () async {
                          await pickDate();
                        },
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        text: 'Referal code',
                        controller: codeController,
                      ),
                      Constants.height10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: ()async{
                             await  getImage();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.drawerColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text('Upload Screenshot'),
                            ),
                          ),
                          Constants.width10,
                          Container(
                            height: 50,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.yellow,
                            ),
                            child: selectedImage != null
                                ? Image.file(selectedImage!, fit: BoxFit.cover)
                                : const Center(
                                    child: Text("Please Get the Image")),
                          ),
                        ],
                      ),
                      CustomElButton(text: 'Request', onPressed: () {})
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const LoginPage()));
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

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1990),
        lastDate: DateTime.now(),
        initialDate: DateTime.now());
    if (picked != null) {
      DateTime pickedDate = picked;
      String formatDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        dateController.text = formatDate;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    dateController.dispose();
    phoneController.dispose();
    codeController.dispose();
  }

  Future<void> _getImage(BuildContext context) async {
    if (selectedImage != null) {
      var imageFile = selectedImage;
      /*var image = imageLib.decodeImage(imageFile.readAsBytesSync());
      fileName = basename(imageFile.path);
      image = imageLib.copyResize(image,
          width: (MediaQuery.of(context).size.width * 0.8).toInt(),
          height: (MediaQuery.of(context).size.height * 0.7).toInt());
      _image = image;*/
    }
  }
}
