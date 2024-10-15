import 'package:flutter/material.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.validator,
    required this.controller,
    this.keyboardType,
    this.onTap,
    this.obscureText = false,
  });

  final String text;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Consumer<FunctionsProvider>(
        builder: (context, functionsProvider, child) {
          return TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            onTap: onTap,
            keyboardType: keyboardType,
            controller: controller,
            obscureText: obscureText && !functionsProvider.isPasswordvisible,
            validator: validator,
            decoration: InputDecoration(
              suffixIcon: obscureText
                  ? IconButton(
                      onPressed: () {
                        functionsProvider.togglePassword();
                      },
                      icon: Icon(
                        functionsProvider.isPasswordvisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.white,
                      ),
                    )
                  : null,
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
          );
        },
      ),
    );
  }
}
