import 'package:flutter/material.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/view/view/authentication/view/loginpage.dart';
import 'package:main_ford/view/view/authentication/view/registerpage.dart';
import 'package:main_ford/view/view/home/view/homepage.dart';
import 'package:main_ford/view/view/home/widgets/customlisttile.dart';
import 'package:main_ford/view/view/profile/view/profilepage.dart';
import 'package:main_ford/view/view/refer/view/referpage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: AppColors.drawerColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constants.height10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.25,
                width: size.width * 0.4,
                child: const Image(
                  image: AssetImage(Constants.mfNoBg),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Column(
            children: [
              CustomListTile(
                text: 'Home',
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const HomePage()));
                },
              ),
              CustomListTile(
                text: 'Profile',
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const ProfilePage()));
                },
              ),
              CustomListTile(
                text: 'Refer and Earn',
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => const ReferPage()));
                },
              ),
              const CustomListTile(
                text: 'Transaction History',
              ),
              CustomListTile(
                text: 'Logout',
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const RegisterPage()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
