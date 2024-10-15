
import 'package:flutter/material.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key, required this.text, this.onTap, this.icon,
  });
  final String text;
  final void Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon,color: AppColors.white,),
            Constants.width20,
            Text(text,style: MyTextStyles.drawerText,),
          ],
        ),
      ),
    );
  }
}
