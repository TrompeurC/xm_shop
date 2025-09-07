import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: PageView(
          controller: controller.pageController,
          children: controller.pages,
          onPageChanged: controller.setCurrentIndex,
        ),

        bottomNavigationBar: BottomNavigationBar(
            type:BottomNavigationBarType.fixed ,
            fixedColor: Colors.red,
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.setCurrentIndex(index);
              controller.pageController.jumpToPage(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
              BottomNavigationBarItem(icon: Icon(Icons.room_service), label: "服务"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "购物"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的")
            ]
        ),
      );
    });
  }
}
