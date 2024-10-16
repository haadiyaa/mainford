
import 'package:flutter/material.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({
    super.key,
    required this.title,
    required this.desc,
  });
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: MyTextStyles.subHeadText,
        ),
        Constants.height5,
        Text(desc),
      ],
    );
  }
}
