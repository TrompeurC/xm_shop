import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  //flutter 修改状态栏的颜色
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor:
  Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(
    ScreenUtilInit(
      designSize: Size(1080, 2400),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: "小米商城",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        defaultTransition: Transition.rightToLeft,
        getPages: AppPages.routes,
      ),
    )
  );
}
