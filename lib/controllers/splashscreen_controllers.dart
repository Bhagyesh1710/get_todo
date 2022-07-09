import 'package:get/get.dart';
import 'package:get_todo/routes/app_routes_name.dart';

import '../services/shared_prefrence_service.dart';

class SplashScreenController extends GetxController {
  final PrefService prefService = PrefService();

  @override
  void onInit() {
    prefService.readData('userData').then((value) => value != null
        ? Future.delayed(const Duration(seconds: 5), () {
            pushToScreen(value: kTodoHomePage);
          })
        : Future.delayed(const Duration(seconds: 5), () {
            pushToScreen(value: kLoginPage);
          }));
    super.onInit();
  }

  pushToScreen({required String value}) {
    Get.offNamed(value);
  }
}
