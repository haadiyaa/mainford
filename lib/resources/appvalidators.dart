import 'dart:io';

class AppValidators {
  String? nameValidator({required String? value}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
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
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
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
