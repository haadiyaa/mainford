import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main_ford/controller/authprovider.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/appvalidators.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/authentication/view/loginpage.dart';
import 'package:main_ford/view/view/authentication/widgets/custombutton.dart';
import 'package:main_ford/view/view/authentication/widgets/customtextfield.dart';
import 'package:main_ford/view/view/home/widgets/mydrawer.dart';
import 'package:main_ford/view/view/profile/widgets/editdialog.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      drawer: const MyDrawer(),
      body: Consumer<FunctionsProvider>(
        builder: (context, value, child) {
          if (value.userModel != null) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                              CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    NetworkImage(value.userModel!.photoUrl),
                              ),
                              Positioned(
                                bottom: -3,
                                right: 35,
                                child: CircleAvatar(
                                  backgroundColor:
                                      AppColors.inputFieldBorderColor,
                                  radius: 12,
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    color: AppColors.white,
                                    onPressed: () {},
                                    icon: const Icon(Icons.add),
                                  ),
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
                      // height: size.height*0.3,
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
                                    'My Referral Code',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 187, 155, 206)),
                                  ),
                                  Constants.height5,
                                  Text(value.userModel!.referralCode),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
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
                                    Text(value.userModel!.accountDetails.holderName),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                    Constants.height20,
                    CustomElButton(
                      text: 'Update Profile',
                      onPressed: () {
                        final val=value.userModel!;
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
                        authProvider.logout().then(
                          (value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginPage()),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hadiya',
                            style: MyTextStyles.headText,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'haadiyact@gmail.com',
                            style: MyTextStyles.subHeadText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constants.height10,
                          Text(
                            'Refaral Code : MFfrdee4ew2w41',
                            style: MyTextStyles.drawerText,
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
                          const CircleAvatar(
                            radius: 40,
                          ),
                          Positioned(
                            bottom: -3,
                            right: 35,
                            child: CircleAvatar(
                              backgroundColor: AppColors.inputFieldBorderColor,
                              radius: 12,
                              child: IconButton(
                                padding: const EdgeInsets.all(0),
                                color: AppColors.white,
                                onPressed: () {},
                                icon: const Icon(Icons.add),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Constants.height20,
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // height: size.height*0.3,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.tileColor),
                  child: const Text('swdwhbdwb'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
