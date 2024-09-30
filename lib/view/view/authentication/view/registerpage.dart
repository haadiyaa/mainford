import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:main_ford/controller/authprovider.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/appvalidators.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/authentication/view/adminapprove.dart';
import 'package:main_ford/view/view/authentication/view/loginpage.dart';
import 'package:main_ford/view/view/authentication/widgets/custombutton.dart';
import 'package:main_ford/view/view/authentication/widgets/customtextfield.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
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
  final TextEditingController codeController = TextEditingController();
  final key = GlobalKey<FormState>();
  final AppValidators appValidators = AppValidators();
  File? selectedImage;
  String? imageValidation;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final functionProvider =
        Provider.of<FunctionsProvider>(context, listen: false);

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
                        validator: (value) {
                          return appValidators.nameValidator(value: value);
                        },
                      ),
                      CustomTextField(
                        validator: (value) {
                          return appValidators.emailValidator(value: value);
                        },
                        keyboardType: TextInputType.emailAddress,
                        text: 'Email',
                        controller: emailController,
                      ),
                      CustomTextField(
                        validator: (value) {
                          return appValidators.phoneValidator(value: value);
                        },
                        keyboardType: TextInputType.phone,
                        text: 'Phone Number',
                        controller: phoneController,
                      ),
                      CustomTextField(
                        validator: (value) {
                          return appValidators.dobValidator(value: value);
                        },
                        text: 'Date of Birth',
                        controller: dateController,
                        keyboardType: TextInputType.none,
                        onTap: () async {
                          await pickDate();
                        },
                      ),
                      CustomTextField(
                        validator: (value) {
                          return appValidators.referralValidator(value: value);
                        },
                        keyboardType: TextInputType.name,
                        text: 'Referal code',
                        controller: codeController,
                      ),
                      Constants.height10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await getImage();
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
                              selectedImage != null
                                  ? Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: selectedImage != null
                                              ? Image.file(selectedImage!,
                                                  fit: BoxFit.cover)
                                              : null,
                                        ),
                                        ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.transparent),
                                          onPressed: () {
                                            print('object');
                                            setState(() {
                                              selectedImage = null;
                                            });
                                          },
                                          label: const Icon(
                                            Icons.cancel_outlined,
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          imageValidation != null
                              ? Text(imageValidation!,
                                  style: const TextStyle(
                                      color: AppColors.red, fontSize: 10))
                              : const SizedBox(
                                  height: 10,
                                ),
                        ],
                      ),
                      CustomElButton(
                        text: 'Request',
                        onPressed: () async {
                          if (key.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            if (selectedImage == null) {
                              setState(() {
                                imageValidation = appValidators.imageValidator(
                                    value: selectedImage);
                              });
                            } else {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.loading,
                                text: "Please wait",
                              );
                              await authProvider
                                  .registerUser(
                                file: selectedImage!,
                                filename: selectedImage!.path.split('/').last,
                                name: nameController.text.trim(),
                                phone: phoneController.text.trim(),
                                email: emailController.text.trim(),
                                dob: dateController.text.trim(),
                                refer: codeController.text.trim(),
                              )
                                  .then(
                                (value) {
                                  Navigator.pop(context);
                                  if (authProvider.status == Status.requested) {
                                    QuickAlert.show(
                                        confirmBtnColor: AppColors.bgColor,
                                        context: context,
                                        type: QuickAlertType.success,
                                        text: 'Request Successful!',
                                        onConfirmBtnTap: () {
                                          Navigator.pop(context);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const AdminApprovePage()));
                                        });
                                  }
                                  if (authProvider.status ==
                                      Status.requestFailed) {
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
                          }
                        },
                      ),
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
        imageValidation = null;
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
}
