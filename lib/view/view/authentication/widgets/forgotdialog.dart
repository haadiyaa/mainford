import 'package:flutter/material.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/appvalidators.dart';
import 'package:main_ford/view/view/authentication/widgets/custombutton.dart';
import 'package:main_ford/view/view/authentication/widgets/customtextfield.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ForgotPasswordDialog extends StatelessWidget {
  ForgotPasswordDialog({
    super.key,
  });
  final TextEditingController email = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.bgColor,
      title: const Text('Forgot Password'),
      content: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Enter your Email id'),
            CustomTextField(obscureText: false,
              text: 'Email',
              controller: email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return AppValidators().emailValidator(value: value);
              },
            ),
            CustomElButton(
              text: 'Send',
              onPressed: () {
                if (_key.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                  final functionsProvider =
                      Provider.of<FunctionsProvider>(context, listen: false);
                  QuickAlert.show(
                    confirmBtnColor: AppColors.bgColor,
                    autoCloseDuration: const Duration(seconds: 3),
                    context: context,
                    type: QuickAlertType.loading,
                    text: 'Please wait',
                  );
                  functionsProvider.forgotPassword(email.text.trim()).then(
                    (value) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(functionsProvider.message)));
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
