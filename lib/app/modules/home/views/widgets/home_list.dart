import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/home/controllers/home_controller.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomeList extends GetView<HomeController> {
  const HomeList({super.key});

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
        loop:true,
        itemCount: controller.swiperList.length,
        pagination: const SwiperPagination(
            builder: SwiperPagination.rect
        ),
        // control: const SwiperControl(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller.scrollController,
      itemCount: 20,
      itemBuilder: (context, index) {
        if (index == 0) {
          // return SizedBox(

          //   child: Image.network(
          //     "https://www.itying.com/images/focus/focus02.png",
          //     fit: BoxFit.contain,
          //   ),
          // );
          return Obx(() => _buildSwiper());
        } else {
          return ListTile(title: Text('woc'));
        }
      },
    );
  }
}
