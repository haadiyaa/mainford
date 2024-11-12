
import 'package:flutter/material.dart';
import 'package:main_ford/resources/appcolors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.size,
    required this.child,
  });

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.tileColor,
      ),
      child: child,
    );
  }
}
