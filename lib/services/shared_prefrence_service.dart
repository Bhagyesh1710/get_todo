import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get_todo/models/login_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  Future createData(String username, String email, String password) async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    LogInData user =
        LogInData(userName: username, email: email, password: password);
    String userData = jsonEncode(user);
    debugPrint(userData);
    var dataCreate = prefrences.setString("userData", userData);
    return dataCreate;
  }

  Future readData(String user) async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();

    var readPwd = prefrences.getString("userData");
    debugPrint(readPwd);
    return readPwd;
  }

  Future removeCache(String password) async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();

    var removePwd = prefrences.remove("userData");
    return removePwd;
  }
}
