import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/home/controllers/home_controller.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

class HomeHot extends GetView<HomeController> {
  const HomeHot({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildTitle() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: ScreenAdapter.width(20),
          horizontal: ScreenAdapter.width(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '热销甄选',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: ScreenAdapter.fontSize(46),
              ),
            ),
            Text(
              '更多手机推荐 >',
              style: TextStyle(
                color: Colors.black54,
                fontSize: ScreenAdapter.fontSize(38),
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildHotList() {
      return Obx(() {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(30),
            0,
            ScreenAdapter.width(30),
            ScreenAdapter.width(20),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: ScreenAdapter.height(738),
                  child: Swiper(
                    itemBuilder: (context, index) {
                      return Image.network(
                        controller.hotSwiperList[index].pic!,
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: controller.hotSwiperList.length,
                    indicatorLayout: PageIndicatorLayout.COLOR,
                    autoplay: false,
                    loop: true,
                    pagination: SwiperPagination(
                      margin: const EdgeInsets.all(0.0),
                      builder: SwiperCustomPagination(
                        builder:
                            (BuildContext context, SwiperPluginConfig config) {
                              return ConstrainedBox(
                                constraints: const BoxConstraints.expand(
                                  height: 50.0,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Align(
                                        // alignment: Alignment.bottomCenter,
                                        child:
                                            const RectSwiperPaginationBuilder(
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
                ),
              ),
              SizedBox(width: ScreenAdapter.width(20)),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: controller.hotProductList.asMap().entries.map((
                    entry,
                  ) {
                    var key = entry.key;
                    var value = entry.value;
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: key != 2 ? ScreenAdapter.height(20) : 0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
                          color: const Color.fromRGBO(246, 246, 246, 1),
                          
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  SizedBox(height: ScreenAdapter.height(20)),
                                  Text(
                                    "${value.title}",
                                    style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(38),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: ScreenAdapter.height(20)),
                                  Text(
                                    "${value.subTitle}",
                                    style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(28),
                                    ),
                                  ),
                                  SizedBox(height: ScreenAdapter.height(20)),
                                  Text(
                                    "￥${value.price}元",
                                    style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: ScreenAdapter.width(20)),
                            Expanded(
                              flex: 2,
                              child: Padding(padding: EdgeInsets.all(8), child: Image.network(value.pic!, fit: BoxFit.cover)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      });
    }

    return Column(children: [_buildTitle(), _buildHotList()]);
  }
}
