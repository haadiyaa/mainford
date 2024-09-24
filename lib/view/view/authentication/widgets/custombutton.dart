
import 'package:flutter/material.dart';
import 'package:main_ford/resources/appcolors.dart';

class CustomElButton extends StatelessWidget {
  const CustomElButton({
    super.key, required this.text,required this.onPressed,
  });

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.tileColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}