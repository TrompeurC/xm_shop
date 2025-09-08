import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/home/controllers/home_controller.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

class HomeList extends GetView<HomeController> {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller.scrollController,
      itemCount: 20,
      itemBuilder: (context, index) {
        if (index == 0) {
          return SizedBox(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(800),
            child: Image.network(
              "https://www.itying.com/images/focus/focus02.png",
              fit: BoxFit.contain,
            ),
          );
        } else {
          return ListTile(title: Text('woc'));
        }
      },
    );
  }
}
