import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xm_shop/app/modules/home/views/widgets/home_app_bar.dart';
import 'package:xm_shop/app/modules/home/views/widgets/home_list.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: -ScreenAdapter.statusBarHeight() - ScreenAdapter.height(50),
            right: 0,
            bottom: 0,
            child: HomeList(),
          ),
          Positioned(top: 0, left: 0, right: 0, child: HomeAppBar()),
        ],
      ),
    );
  }
}
