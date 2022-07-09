import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/splashscreen_controllers.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final SplashScreenController splashScreen = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 16.w / 9.h,
              child: Container(
                //height: 100.h,
                //width: 100.w,
                padding: const EdgeInsets.all(36.0),
                child: Image.asset(
                  'assets/images/todo.png',
                  //fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CircularProgressIndicator(color: Colors.black, strokeWidth: 1.w),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Get Todo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            )
          ],
        ),
      ),
    );
  }
}
