import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:main_ford/controller/authprovider.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/authentication/view/loginpage.dart';
import 'package:main_ford/view/view/authentication/widgets/custombutton.dart';
import 'package:main_ford/view/view/profile/widgets/editdialog.dart';
import 'package:main_ford/view/view/profile/widgets/profileloaderwidget.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? selectedImage;

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Consumer<FunctionsProvider>(
        builder: (context, value, child) {
          if (value.userModel != null) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                value.userModel!.name,
                                style: MyTextStyles.headText,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                value.userModel!.email,
                                style: MyTextStyles.subHeadText,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              selectedImage == null
                                  ? CircleAvatar(
                                      radius: 40,
                                      backgroundImage: NetworkImage(
                                          value.userModel!.photoUrl),
                                    )
                                  : Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        // color: AppColors.goldenyellow,
                                        image: DecorationImage(
                                          image: FileImage(selectedImage!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                              Positioned(
                                bottom: -10,
                                right: 10,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  style: IconButton.styleFrom(
                                    foregroundColor: AppColors.white,
                                    backgroundColor:
                                        AppColors.inputFieldBorderColor,
                                  ),
                                  onPressed: () async {
                                    await getImage();
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Constants.height20,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.tileColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Persona Details',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 187, 155, 206)),
                              ),
                              Constants.height5,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Phone',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 224, 198, 240)),
                                  ),
                                  Text(value.userModel!.phone),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Date of Birth',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 224, 198, 240)),
                                  ),
                                  Text(DateFormat('dd/MM/yyyy')
                                      .format(value.userModel!.dob)),
                                ],
                              ),
                            ],
                          ),
                          Constants.height10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'User ID',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 187, 155, 206)),
                                  ),
                                  Constants.height5,
                                  Text(value.userModel!.referralCode),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  final functionsProvider =
                                      Provider.of<FunctionsProvider>(context,
                                          listen: false);
                                  functionsProvider.shareReferralCode(
                                      value.userModel!.referralCode);
                                },
                                icon: const Icon(
                                  Icons.ios_share,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Constants.height20,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.tileColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Referred By ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 187, 155, 206)),
                          ),
                          Constants.height5,
                          Text(value.userModel!.referredBy.name.toUpperCase()),
                          Text(value.userModel!.referredBy.email),
                        ],
                      ),
                    ),
                    Constants.height20,
                    value.userModel!.accountDetails.accountNumber.isNotEmpty
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            // height: size.height*0.3,
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.tileColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Account Details',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 187, 155, 206)),
                                ),
                                Constants.height5,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Account Number',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 224, 198, 240)),
                                    ),
                                    Text(value.userModel!.accountDetails
                                        .accountNumber),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'IFSC Code',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 224, 198, 240)),
                                    ),
                                    Text(value.userModel!.accountDetails.ifsc),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Holder\'s Name',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 224, 198, 240)),
                                    ),
                                    Text(value
                                        .userModel!.accountDetails.holderName),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    Constants.height20,
                    CustomElButton(
                      text: 'Update Profile',
                      onPressed: () {
                        final val = value.userModel!;
                        showDialog(
                          context: context,
                          builder: (context) => EditDialog(
                            name: val.name,
                            accNum: val.accountDetails.accountNumber,
                            ifsc: val.accountDetails.ifsc,
                            holder: val.accountDetails.holderName,
                          ),
                        );
                      },
                    ),
                    CustomElButton(
                      text: 'LOGOUT',
                      onPressed: () {
                        final authProvider =
                            Provider.of<AuthProvider>(context, listen: false);
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.confirm,
                          text: "Are you sure you want to logout?",
                          onConfirmBtnTap: () {
                            authProvider.logout().then(
                              (value) {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const LoginPage()),
                                );
                              },
                            );
                          },
                          onCancelBtnTap: () {
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return ProfileLoaderWidget(size: size);
        },
      ),
    );
  }
}
