
import 'package:flutter/material.dart';
import 'package:main_ford/controller/authprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/authentication/view/loginpage.dart';
import 'package:main_ford/view/view/authentication/widgets/custombutton.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ProfileLoaderWidget extends StatelessWidget {
  const ProfileLoaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
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
                const Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '_ _ _ _',
                        style: MyTextStyles.headText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '_ _ _ _ _ _',
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
                      const CircleAvatar(
                        radius: 40,
                        // backgroundImage:
                        //     NetworkImage(value.userModel!.photoUrl),
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Persona Details',
                        style: TextStyle(
                            color: Color.fromARGB(255, 187, 155, 206)),
                      ),
                      Constants.height5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Phone',
                            style: TextStyle(
                                color:
                                    Color.fromARGB(255, 224, 198, 240)),
                          ),
                          Text('_ _ _ _ _ _ _'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date of Birth',
                            style: TextStyle(
                                color:
                                    Color.fromARGB(255, 224, 198, 240)),
                          ),
                          Text('__-__-___'),
                        ],
                      ),
                    ],
                  ),
                  Constants.height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Referral Code',
                            style: TextStyle(
                                color:
                                    Color.fromARGB(255, 187, 155, 206)),
                          ),
                          Constants.height5,
                          Text('MF-_____'),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Referred By ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 187, 155, 206)),
                  ),
                  Constants.height5,
                  Text('_ _ _ _ _'),
                  Text('_ _ _ _ _ _ _'),
                ],
              ),
            ),
            Constants.height20,
            Constants.height20,
            CustomElButton(
              text: 'Update Profile',
              onPressed: () {
               
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
                        // Navigator.pop(context);
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
}
