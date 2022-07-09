import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_todo/routes/app_routes_name.dart';

import '../services/shared_prefrence_service.dart';

class LoginControllers extends GetxController {
  final PrefService prefService = PrefService();

  void validationDetails(
      {required String name, required String email, required String password}) {
    if (GetUtils.isLengthLessThan(name, 0)) {
      getSnackBar(title: "Username", message: "Username cannot be null");
    } else if (GetUtils.isLengthLessThan(email, 0)) {
      getSnackBar(title: 'Email', message: 'Email cannot be null');
    } else if (!GetUtils.isEmail(email)) {
      getSnackBar(title: 'Email', message: 'Email is invalid');
    } else if (GetUtils.isLengthLessOrEqual(password, 0)) {
      getSnackBar(title: 'Password', message: 'Password cannot be null');
    } else if (GetUtils.isLengthLessOrEqual(password, 5)) {
      getSnackBar(title: "Password", message: 'Password character must be six');
    } else {
      prefService
          .createData(name, email, password)
          .whenComplete(() => Get.offNamed(kTodoHomePage));
    }
  }

  void getSnackBar({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
