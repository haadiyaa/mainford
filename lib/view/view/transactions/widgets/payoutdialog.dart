import 'package:flutter/material.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/view/view/authentication/widgets/custombutton.dart';
import 'package:main_ford/view/view/authentication/widgets/customtextfield.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class PayoutDialog extends StatelessWidget {
  PayoutDialog({super.key});

  final TextEditingController amount = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final functionsProvider =
        Provider.of<FunctionsProvider>(context, listen: false);
    return AlertDialog(
      backgroundColor: AppColors.bgColor,
      title: const Text('Withdraw Money'),
      content: Form(
        key: _key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Enter the amount to request withdrawal'),
            Constants.height5,
            CustomTextField(
              obscureText: false,
              text: 'Amount',
              controller: amount,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter the amount';
                } else if (int.parse(value) <= 0) {
                  return 'Amount should be greater than zero';
                } else {
                  return null;
                }
              },
            ),
            CustomElButton(
              text: 'Send Request',
              onPressed: () {
                if (_key.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                  QuickAlert.show(
                    confirmBtnColor: AppColors.bgColor,
                    context: context,
                    type: QuickAlertType.loading,
                    text: 'Please wait',
                  );
                  functionsProvider.requestWithdraw(amount.text.trim()).then(
                    (value) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(functionsProvider.message)));
                      functionsProvider.getPayementData();
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
