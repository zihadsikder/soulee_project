import 'package:get/get.dart';
import 'package:soulee_project/app/modules/home/views/screens/login_screen.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/screens/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () =>  LoginScreen(),

    ),
  ];
}
