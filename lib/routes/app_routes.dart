import 'package:get/get.dart';
import 'package:get_todo/routes/app_routes_name.dart';
import 'package:get_todo/views/login_view/login_page.dart';
import 'package:get_todo/views/splash_screen.dart';
import 'package:get_todo/views/todo_view/todo_homepage.dart';

import '../views/todo_view/addtodo_page.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: kSplashPage, page: () => SplashScreen()),
    GetPage(name: kLoginPage, page: () => LoginPage()),
    GetPage(name: kTodoHomePage, page: () => TodoHomePage()),
    GetPage(name: kAddTodoPage, page: () => AddTodoPage()),
  ];
}
