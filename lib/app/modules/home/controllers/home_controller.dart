import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xm_shop/app/models/swiper_model.dart';

import '../../../utils/request.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  ScrollController scrollController = ScrollController();
  RxBool isTop = true.obs;
  RxList<SwiperItemModel> swiperList = <SwiperItemModel>[].obs;

  // 获取首页的轮播图
  void getSwiper() async {
    final res = await request.get("/focus");
    var swipers = SwiperModel.fromJson(res.data);
    var list = swipers.result!.map((item) {
      item.pic = '$IMAGE_URL/${item.pic!.replaceAll("\\", "/")}';
      return item;
    }).toList();
    swiperList.value = list;
  }

  @override
  void onInit() {
    super.onInit();
    getSwiper();
    scrollController.addListener(() {
      isTop.value = scrollController.position.pixels < 10;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
