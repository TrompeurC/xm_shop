import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/give/views/give_view.dart';
import 'package:xm_shop/app/modules/home/controllers/home_controller.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

class HomeCategory extends GetView<HomeController> {
  const HomeCategory({super.key});

  Widget _buildCategory() {
    return Obx(
      () => Swiper(
        itemBuilder: (context, index) {
          return GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: ScreenAdapter.width(20),
              mainAxisSpacing: ScreenAdapter.height(20),
            ),
            itemBuilder: (context, i) {
              final currentItem = controller.categoryList[10 * index + i];
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: ScreenAdapter.height(140),
                    height: ScreenAdapter.height(140),
                    child: Image.network(
                      currentItem.pic!,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(height: ScreenAdapter.height(12)),
                  Text(
                    currentItem.title!,
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                  ),
                ],
              );
            },
          );
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: false,
        itemCount: controller.categoryList.isEmpty ? 0 : 2,
        pagination: SwiperPagination(
          margin: const EdgeInsets.all(0.0),
          builder: SwiperCustomPagination(
            builder: (BuildContext context, SwiperPluginConfig config) {
              return ConstrainedBox(
                constraints: const BoxConstraints.expand(height: 50.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: const RectSwiperPaginationBuilder(
                          color: Colors.black12,
                          activeColor: Colors.black,
                          size: Size(20, 3),
                          activeSize: Size(20, 3),
                          space: 0.0,
                        ).build(context, config),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenAdapter.width(470),
      width: ScreenAdapter.height(1080),
      child: _buildCategory(),
    );
  }
}
