import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/home/controllers/home_controller.dart';
import 'package:xm_shop/app/modules/home/views/widgets/home_category.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomeList extends GetView<HomeController> {
  const HomeList({super.key});

  // 构建轮播图
  Widget _buildSwiper() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(700),
      child: Swiper(
        itemBuilder: (context, index) {
          return Image.network(
            controller.swiperList[index].pic!,
            fit: BoxFit.fill,
          );
        },
        // indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: true,
        loop: true,
        itemCount: controller.swiperList.length,
        pagination: const SwiperPagination(builder: SwiperPagination.rect),
        // control: const SwiperControl(),
      ),
    );
  }

  // 构建Banner
  Widget _buildBanner () {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(92),
      child: Image.asset("assets/images/xiaomiBanner.png", fit: BoxFit.cover,),

    );
  }

  // 构建category

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller.scrollController,
      children: [
        Obx(() => _buildSwiper()),
        _buildBanner(),
        HomeCategory(),
      ],
    );
  }
}
