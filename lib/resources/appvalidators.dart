import 'dart:io';

class AppValidators {
  String? nameValidator({required String? value}) {
    final name = RegExp(r'^[A-Za-z\s]+$');
    if (value!.isEmpty) {
      return 'User name can\'t be empty';
    } else if (!name.hasMatch(value)) {
      return "Enter a valid name";
    } else if (value.length < 3) {
      return 'User name should be atleast 3 characters long';
    } else {
      return null;
    }
  }

  String? emailValidator({required String? value}) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else {
      return null;
    }
  }

  String? phoneValidator({required String? value}) {
    final reg2 = RegExp(r"^[6789]\d{9}$");
    if (value!.isEmpty) {
      return 'Number can\'t be empty';
    } else if (value.length > 10) {
      return "Phone number should be exact 10";
    } else if (!reg2.hasMatch(value)) {
      return 'Enter a valid phone number';
    } else {
      return null;
    }
  }

  String? dobValidator({required String? value}) {
    if (value == null || value.isEmpty) {
      return 'Please enter your date of birth';
    } else {
      return null;
    }
  }

  String? referralValidator({required String? value}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a referral code';
    } else {
      return null;
    }
  }

  String? imageValidator({required File? value}) {
    if (value == null) {
      return 'Please select an image';
    } else {
      return null;
    }
  }
}
