import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
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
  bool? adminApproved;
  final ApiRepositories apiRepositories = ApiRepositories();

  Future<void> loginUser(
      {required String email, required String password}) async {
    var sharedPref = await SharedPreferences.getInstance();
    status = Status.loading;
    notifyListeners();
    try {
      final response =
          await apiRepositories.login(email: email, password: password);
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        status = Status.login;
        adminApproved = true;
        notifyListeners();
        await sharedPref.setString(
            Constants.regToken, data['token'].toString());
        print('login success token : ${data['token']}');
        if (adminApproved != null) {
          await sharedPref.setBool(Constants.adminApproved, adminApproved!);
        }
      } else {
        print('login error');
        status = Status.loginFailed;
        msg = data['message'];
        print(msg);
        notifyListeners();
      }
    } catch (e) {
      print('exception ${e.toString()}');
      status = Status.loginFailed;
      msg = e.toString();
      print(msg);
      notifyListeners();
    }
  }

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
      print('status ${response.statusCode}');
      final data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        print('success');
        print('token : ${data['token']}');
        status = Status.requested;
        adminApproved = false;
        notifyListeners();
        await sharedPref.setString(
            Constants.regToken, data['token'].toString());
        if (adminApproved != null) {
          await sharedPref.setBool(Constants.adminApproved, adminApproved!);
        }
      } else {
        print('error');
        status = Status.requestFailed;
        msg = data['message'];
        notifyListeners();
      }
      print('completed');
    } catch (e) {
      print('exception ${e.toString()}');
      status = Status.requestFailed;
      msg = e.toString();
      notifyListeners();
    }
  }

  Future<void> checkStatus() async {
    var sharedPref = await SharedPreferences.getInstance();
    final token = sharedPref.getString(Constants.regToken);
    final approval = sharedPref.getBool(Constants.adminApproved);
    if (token != null) {
      print('tokennnn: $token');

      try {
        final response = await apiRepositories.checkStatus(token: token);
        final data = jsonDecode(response.body);
        print('data: $data');
        if (response.statusCode == 200) {
          if (data['isApproved'] == true) {
            adminApproved = true;
            notifyListeners();
            sharedPref.setBool(Constants.adminApproved, adminApproved!);
          } else {
            adminApproved = false;
            notifyListeners();
            sharedPref.setBool(Constants.adminApproved, adminApproved!);
          }
        } else {
          adminApproved = false;
          notifyListeners();
          sharedPref.setBool(Constants.adminApproved, adminApproved!);
        }
      } catch (e) {
        print('exception checking approval ${e.toString()}');
        adminApproved = false;
        notifyListeners();
        sharedPref.setBool(Constants.adminApproved, adminApproved!);
      }
    } else {
      // requested = null;
      // notifyListeners();
      print('token null : $token');
      // adminApproved = false;
      // notifyListeners();
      // sharedPref.setBool(Constants.adminApproved, adminApproved!);
    }
  }

  Future<void> logout() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.clear();
  }
}
