import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/home/controllers/home_controller.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

import '../../../../utils/icon_font.dart';

class HomeAppBar extends GetView<HomeController> {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Color color = (controller.isTop.value ? Colors.white : Colors.grey[400]) as Color;
      return AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: controller.isTop.value ?  Colors.transparent : Colors.white,
        leading: controller.isTop.value
            ? Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Icon(IconFont.xiaomi, color: Colors.white, size: 32),
              )
            : Text(''),
        leadingWidth: controller.isTop.value
            ? ScreenAdapter.width(140)
            : ScreenAdapter.width(40),
        title: InkWell(
          onTap: () => Get.toNamed("search"),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: ScreenAdapter.height(96),
            width: controller.isTop.value
                ? ScreenAdapter.width(620)
                : ScreenAdapter.width(800),
            decoration: BoxDecoration(
              color: const Color.fromARGB(230, 252, 243, 236),
              borderRadius: const BorderRadiusGeometry.all(Radius.circular(30)),
              // border: BoxBorder.all(color: color, width: 1),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey[400]),
                      SizedBox(width: 4),
                      Text(
                        '请搜索',
                        style: TextStyle(color: Colors.grey[400], fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(Icons.settings_overscan_sharp, color: Colors.grey[400]),
                ],
              ),
            ),
          ),
        ),
        actions: [
          Icon(IconFont.category, size: 28, color: color),
          SizedBox(width: 10),
          Badge(
            backgroundColor: Colors.red,
            textColor: Colors.white,
            label: Text('1'),
            textStyle: TextStyle(fontSize: 14),
            offset: Offset(10, -4),
            child: Icon(IconFont.chat, size: 28, color: color),
          ),
          SizedBox(width: 20),
        ],
      );
    });
  }
}
