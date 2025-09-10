import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xm_shop/app/models/category_model.dart';
import 'package:xm_shop/app/models/product_model.dart';
import 'package:xm_shop/app/models/swiper_model.dart';

import '../../../utils/request.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  ScrollController scrollController = ScrollController();
  RxBool isTop = true.obs;
  RxList<SwiperItemModel> swiperList = <SwiperItemModel>[].obs;
  RxList<CategoryItemModel> categoryList = <CategoryItemModel>[].obs;
  RxList<SwiperItemModel> hotSwiperList = <SwiperItemModel>[].obs;
  RxList<ProductItemModel> hotProductList = <ProductItemModel>[].obs;
  RxList<ProductItemModel> waterfallProductList = <ProductItemModel>[].obs;

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
  
  // 获取category
  void getCategory () async {
    final res = await request.get("/bestCate");
    var category = CategoryModel.fromJson(res.data);
    categoryList.value = category.result!.map((item)  {
      item.pic = "$IMAGE_URL/${item.pic!.replaceAll("\\", "/")}";
      return item;
    }).toList();
  }

  // 获取热销轮播图
  void getHotSwiper () async  {
    var res = await request.get("/focus", queryParameters: {
      "position": 2
    });
    var swiperRes = SwiperModel.fromJson(res.data);
    hotSwiperList.value = swiperRes.result!.map((item) {
      item.pic = '${IMAGE_URL}/${item.pic!.replaceAll("\\", '/')}';
      return item;
    }).toList();
  }
 
  // 获取热销产品
  void getHotProduct () async {
    var res = await request.get('/plist',queryParameters: {
      "is_hot": 1,
    } );
    var hotProductRes = ProductModel.fromJson(res.data);
    hotProductList.value = hotProductRes.result!.map((item) {
      item.pic = '${IMAGE_URL}/${item.pic!.replaceAll("\\", "/")}';
      return item;
    }).toList();
  }

  // 获取瀑布流
  void getWaterfallProduct () async {
    var res = await request.get("/plist");
    var waterfallRes = ProductModel.fromJson(res.data);
    waterfallProductList.value = waterfallRes.result!.map((item) {
      item.pic = '${IMAGE_URL}/${item.pic!.replaceAll("\\", "/")}';
      return item;
    }).toList();
  }
  
  @override
  void onInit() {
    super.onInit();
    getSwiper();
    getCategory();
    getHotSwiper();
    getHotProduct();
    getWaterfallProduct();
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
