import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:main_ford/repository/apirepositories.dart';

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
        status = Status.requested;
        notifyListeners();
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
}
