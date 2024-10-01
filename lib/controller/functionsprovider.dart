import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:main_ford/model/referralmodel.dart';
import 'package:main_ford/repository/apirepositories.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FunctionsProvider extends ChangeNotifier {
  final ApiRepositories apiRepositories = ApiRepositories();
  ReferralModel? referralModel;

  Future<void> getReferal() async {
    var sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString(Constants.regToken);

    try {
      if (token != null) {
        final response = await apiRepositories.getReferrals(token: token);
        final data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          referralModel = ReferralModel.fromJson(data);
          notifyListeners();
          print('refferrals: ${referralModel!.referrals}');
        } else {
          print('referal error');
        }
      } else {
        print('referal token null');
      }
    } catch (e) {
      print('exception-referal : ${e.toString()}');
    }
  }
}
