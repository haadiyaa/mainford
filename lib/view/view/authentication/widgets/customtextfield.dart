
import 'package:flutter/material.dart';
import 'package:main_ford/resources/appcolors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.text, this.validator,required this.controller, this.keyboardType, this.onTap,
  });

  final String text;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: TextFormField(
        onTap: onTap,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(color: AppColors.white),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.inputFieldBorderColor,
              width: 2,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.inputFieldBorderColor,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.inputFieldBorderColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
