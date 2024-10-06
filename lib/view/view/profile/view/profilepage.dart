import 'package:flutter/material.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/authentication/view/loginpage.dart';
import 'package:main_ford/view/view/authentication/widgets/custombutton.dart';
import 'package:main_ford/view/view/home/widgets/mydrawer.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                            // Constants.height10,
                            // Text(
                            //   'Refarral Code : ${value.userModel!.referralCode}',
                            //   style: MyTextStyles.drawerText,
                            //   maxLines: 1,
                            //   overflow: TextOverflow.ellipsis,
                            // ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'My Referral Code',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 187, 155, 206)),
                            ),
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
                        const Text(
                          'Referred By ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 187, 155, 206)),
                        ),
                        Text(value.userModel!.referredBy.name.toUpperCase()),
                        Text(value.userModel!.referredBy.email),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: CustomElButton(
          text: 'LOGOUT',
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
            );
          },
        ),
      ),
    );
  }
}
