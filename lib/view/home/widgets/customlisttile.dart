
import 'package:flutter/material.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/mytextstyles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text,style: MyTextStyles.drawerText,),
    );
  }
}
