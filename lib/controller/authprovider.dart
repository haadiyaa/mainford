import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:main_ford/model/getusermodel.dart';
import 'package:main_ford/repository/apirepositories.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status {
  loading,
  requested,
  requestAccept,
  requestFailed,
  initial,
  login,
  loginFailed
}

class AuthProvider extends ChangeNotifier {
  Status status = Status.initial;
  String msg = '';
  bool? requested ;
  final ApiRepositories apiRepositories = ApiRepositories();
  Future<void> registerUser({
    required File file,
    required String filename,
    required String name,
    required String phone,
    required String email,
    required String dob,
    required String refer,
  }) async {
    var sharedPref = await SharedPreferences.getInstance();

    status = Status.loading;
    notifyListeners();
    print('loading');
    try {
      final response = await apiRepositories.registeRequest(
          file: file,
          filename: filename,
          name: name,
          phone: phone,
          email: email,
          dob: dob,
          refer: refer);
      print(response.statusCode);
      final data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        print('success');
        print('token : ${data['token']}');
        status = Status.requested;
        notifyListeners();
        await sharedPref.setString(
            Constants.regToken, data['token'].toString());
        await sharedPref.setBool(Constants.isRegistered, true);
      } else {
        print('error');
        status = Status.requestFailed;
        msg = data['message'];
        notifyListeners();
      }
      print('completed');
    } catch (e) {
      print(e.toString());
      status = Status.requestFailed;
      msg = e.toString();
      notifyListeners();
    }
  }

  void checkStatus() async {
    var sharedPref = await SharedPreferences.getInstance();
    final token = sharedPref.getString(Constants.regToken);
    final isRegistered = sharedPref.getBool(Constants.isRegistered) ?? false;
    GetUserModel getUserModel;
    if (token != null && isRegistered) {
      // notifyListeners();
      try {
        final response = await apiRepositories.getUser(token: token);
        final data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          getUserModel = GetUserModel.fromJson(data);
          print('success');
          if (getUserModel.adminApproved==true) {
            requested=true;
            notifyListeners();
          } else {
            requested=false;
            notifyListeners();
          }
        } else {
          print('error getuser');
        }
      } catch (e) {
        print('exception : ${e.toString()}');
      }
    } else {
      requested = false;
      notifyListeners();
    }
  }
}
