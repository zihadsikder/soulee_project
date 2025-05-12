import 'package:get/get.dart';


import '../../../modules/home/controllers/home_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(),
      fenix: true,
    );
  }}