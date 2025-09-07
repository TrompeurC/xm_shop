
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ScreenAdapter {
  ScreenAdapter._();

  static height (num n) => n.h;

  static width (num n) => n.w;

  static getScreenWidth () => 1.sw;

  static getScreenHeight () => 1.sh;

  static bottomBarHeight () => ScreenUtil().bottomBarHeight;

  static statusBarHeight () => ScreenUtil().statusBarHeight;

  static fontSize (num n) => n.sp;

}