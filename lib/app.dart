import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/data/core/binding/controller_binder.dart';
import 'app/data/core/utils/constans/app_sizer.dart';
import 'app/routes/app_pages.dart';

import 'main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: "Soulee Application",
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          initialBinding: ControllerBinder(),
          themeMode: ThemeMode.system,
          theme: ThemeData(
            primarySwatch: Colors.pink,
            primaryColor: Color(0xFFFF5A60),
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Poppins',
          ),

          defaultTransition: PlatformUtils.isIOS ? Transition.cupertino : Transition.fade,
          locale: Get.deviceLocale,
          builder: (context, child) => PlatformUtils.isIOS
              ? CupertinoTheme(data: const CupertinoThemeData(), child: child!)
              : child!,
        );
      },
    );
  }

}