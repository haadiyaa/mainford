import 'package:flutter/material.dart';
import 'package:main_ford/controller/authprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/view/view/authentication/view/loginpage.dart';
import 'package:main_ford/view/view/authentication/view/registerpage.dart';
import 'package:main_ford/view/view/home/view/homepage.dart';
import 'package:main_ford/view/view/home/widgets/customlisttile.dart';
import 'package:main_ford/view/view/profile/view/profilepage.dart';
import 'package:main_ford/view/view/refer/view/referpage.dart';
import 'package:main_ford/view/view/transactions/view/transactions.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

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
                      MaterialPageRoute(builder: (_) => ProfilePage()));
                },
              ),
              CustomListTile(
                text: 'Referrals',
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const ReferPage()));
                },
              ),
              CustomListTile(
                text: 'Transactions',
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const TransactionsPage()));
                },
              ),
              CustomListTile(
                text: 'Logout',
                onTap: () {
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
        ],
      ),
    );
  }
}
