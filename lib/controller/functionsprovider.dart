import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:main_ford/model/playlistmodel.dart';
import 'package:main_ford/model/referralmodel.dart';
import 'package:main_ford/model/usermodel.dart';
import 'package:main_ford/model/userpayementmodel.dart';
import 'package:main_ford/repository/apirepositories.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class FunctionsProvider extends ChangeNotifier {
  final ApiRepositories apiRepositories = ApiRepositories();
  ReferralModel? referralModel;
  UserModel? userModel;
  String? youtubeKey;
  UserPayementModel? userPayementModel;
  PlayListModel? playListModel1;
  PlayListModel? playListModel2;
  PlayListModel? playListModel3;
  String message = '';
  bool isPasswordvisible = false;
  void togglePassword() {
    isPasswordvisible = !isPasswordvisible;
    notifyListeners();
  }

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

  Future<UserModel?> getUser() async {
    final sharedPref = await SharedPreferences.getInstance();
    final token = sharedPref.getString(Constants.regToken);
    if (token != null) {
      print('token not null: $token');
      try {
        final response = await apiRepositories.getUser(token: token);
        final data = jsonDecode(response.body);
        print('response : $data');
        if (response.statusCode == 200) {
          print('success');
          userModel = UserModel.fromJson(data);
          notifyListeners();
          print('name: ${userModel!.name}');
        } else {
          print('statuscode: ${response.statusCode}');
        }
      } catch (e) {
        print('exception :${e.toString()}');
      }
    } else {
      print('token null');
    }
    return userModel;
  }

  Future<void> youtube(List<Course> playlistId) async {
    final sharedPref = await SharedPreferences.getInstance();
    final token = sharedPref.getString(Constants.regToken);

    if (token != null) {
      print('token not null : $token');
      try {
        final response = await apiRepositories.youtubeKey(token: token);
        final keys = jsonDecode(response.body);
        print(' apikey: $keys');
        if (response.statusCode == 200) {
          youtubeKey = keys['youtubeApiKey'].toString();
          notifyListeners();
        } else {
          print('status: ${response.statusCode}');
        }
      } catch (e) {
        print('exception key: ${e.toString()}');
      }

      if (youtubeKey != null) {
        try {
          final response1 = await apiRepositories.playlist1(
              apikey: youtubeKey!, playlistId: playlistId[0].url1);
          final response2 = await apiRepositories.playlist1(
              apikey: youtubeKey!, playlistId: playlistId[0].url2);
          final response3 = await apiRepositories.playlist1(
              apikey: youtubeKey!, playlistId: playlistId[0].url3);
          final data1 = jsonDecode(response1.body);
          final data2 = jsonDecode(response2.body);
          final data3 = jsonDecode(response3.body);
          print('playlist1 $data1');
          print('playlist2 $data2');
          print('playlist3 $data3');
          if (response1.statusCode == 200 &&
              response2.statusCode == 200 &&
              response3.statusCode == 200) {
            playListModel1 = PlayListModel.fromJson(data1);
            playListModel2 = PlayListModel.fromJson(data2);
            playListModel3 = PlayListModel.fromJson(data3);
            notifyListeners();
          }
        } catch (e) {
          print(e.toString());
        }
      } else {
        print('youtube key null: $youtubeKey');
      }
    } else {
      print('token null');
    }
  }

  Future<void> updateUser(
      String name, String accNum, String ifsc, String holder) async {
    final sharedPref = await SharedPreferences.getInstance();
    final token = sharedPref.getString(Constants.regToken);
    if (token != null) {
      print('token not null');
      final response = await apiRepositories.updateUser(
          token: token, name: name, accNum: accNum, ifsc: ifsc, holder: holder);
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('updated');
        userModel = UserModel.fromJson(data);
        notifyListeners();
      } else {
        print(response.statusCode);
      }
    } else {
      print('token null');
    }
  }

  Future<void> getPayementData() async {
    final sharedPref = await SharedPreferences.getInstance();
    final token = sharedPref.getString(Constants.regToken);
    if (token != null) {
      try {
        final response = await apiRepositories.payementData(token: token);
        final data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          print('payement details success');
          userPayementModel = UserPayementModel.fromJson(data);
          notifyListeners();
          print('balance: ${userPayementModel!.balance}');
        } else {
          print('not success ${response.statusCode}');
        }
      } catch (e) {
        print('exception ${e.toString()}');
      }
    } else {
      print('token nulll');
    }
  }

  Future<void> requestWithdraw(String amount) async {
    final sharedPref = await SharedPreferences.getInstance();
    final token = sharedPref.getString(Constants.regToken);
    if (token != null) {
      try {
        final response =
            await apiRepositories.requestWithdraw(token: token, amount: amount);
        final data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          message = data['message'];
          notifyListeners();
        } else {
          message = data['message'];
          notifyListeners();
        }
      } catch (e) {
        print('exc:${e.toString()}');
        message = e.toString();
        notifyListeners();
      }
    } else {
      print('token null');
    }
  }

  void launchURLBrowser(String str) async {
    var url = Uri.parse(str);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      final response = await apiRepositories.forgotPass(email: email);
      final data = jsonDecode(response.body);
      print('forgot $data');
      print('status ${response.statusCode}');
      if (response.statusCode == 200) {
        message = data['message'];
        notifyListeners();
      } else {
        message = data['message'];
        notifyListeners();
      }
    } catch (e) {
      message = e.toString();
      notifyListeners();
    }
  }

  Future<void> shareReferralCode(String code) async {
    await Share.share(
        '\u{1F4B5} Earn Guaranteed Rewards! \u{1F4B5} Download the Main Ford app and enter my referral code $code for a guaranteed bonus. Complete the first referral task to unlock even more! Start earning now: https://play.google.com/store/apps/details?id=com.mainford.app');
  }
}
