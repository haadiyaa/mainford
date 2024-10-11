import 'package:flutter/material.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/appvalidators.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/view/view/authentication/widgets/custombutton.dart';
import 'package:main_ford/view/view/authentication/widgets/customtextfield.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class EditDialog extends StatefulWidget {
  EditDialog({
    super.key,
    required this.name,
    required this.accNum,
    required this.ifsc,
    required this.holder,
  });

  final String name;
  final String accNum;
  final String ifsc;
  final String holder;

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  late TextEditingController name;
  late TextEditingController accNumber;
  late TextEditingController ifsc;
  late TextEditingController holder;
  final key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.name);
    accNumber = TextEditingController(text: widget.accNum);
    ifsc = TextEditingController(text: widget.ifsc);
    holder = TextEditingController(text: widget.holder);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AlertDialog(
        scrollable: true,
        backgroundColor: AppColors.bgColor,
        title: const Text('Edit Profile'),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  text: 'Name',
                  controller: name,
                  validator: (value) {
                    return AppValidators().nameValidator(value: value);
                  },
                ),
                Constants.height5,
                Row(
                  children: [
                    const Text(
                      'Account Details',
                      style: TextStyle(fontSize: 10),
                    ),
                    Constants.width5,
                    Expanded(
                      child: Divider(
                        color: AppColors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  text: 'Account Number',
                  keyboardType: TextInputType.number,
                  controller: accNumber,
                  validator: (value) {
                    return AppValidators().accNumValidator(value: value);
                  },
                ),
                CustomTextField(
                  text: 'IFSC Code',
                  keyboardType: TextInputType.visiblePassword,
                  controller: ifsc,
                  validator: (value) {
                    return AppValidators().ifscValidator(value: value);
                  },
                ),
                CustomTextField(
                  text: 'Holder\'s Name',
                  controller: holder,
                  validator: (value) {
                    return AppValidators().holderValidator(value: value);
                  },
                ),
                CustomElButton(
                  text: 'Update',
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.loading,
                        text: "Please wait",
                      );
                      final functionProvider = Provider.of<FunctionsProvider>(
                          context,
                          listen: false);
                      functionProvider
                          .updateUser(name.text.trim(), accNumber.text.trim(),
                              ifsc.text.trim(), holder.text.trim())
                          .then(
                        (value) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      );
                    }
                  },
                ),
                CustomElButton(
                  text: 'Cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
