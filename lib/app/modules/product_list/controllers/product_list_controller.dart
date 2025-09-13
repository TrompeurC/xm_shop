import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xm_shop/app/models/product_detail_model.dart';
import 'package:xm_shop/app/utils/request.dart';

class ProductListController extends GetxController {
  //TODO: Implement SearchController
  RxList<ProductDetailItemModel> productList = <ProductDetailItemModel>[].obs;
  int page = 1;
  int pageSize = 8;
  String search = "";
  RxString sort = ''.obs;
  RxInt currentTabIndex = 0.obs;
  List<String> tabs = ["全部","销量", "价格", '筛选'];
  ScrollController scrollController = ScrollController();
  RxBool hasMore = true.obs;
  bool isLoading = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  void listenOffset () {
    scrollController.addListener(() async{
      if(scrollController.position.pixels > (scrollController.position.maxScrollExtent - 20)) {
          getProductList();
      }
    });
  }

  void changeTabIndex (int index) {
    if(index == 0) {
      sort.value = "";
    } else  {
      if(index == currentTabIndex.value) {
        if(sort.value.contains("price")) {
          sort.value = sort.value == 'price_1' ? 'price_-1' : 'price_1';
        } else {
          sort.value = sort.value == 'salecount_1' ? 'salecount_-1' : 'salecount_1';
        }
      }
    }
    currentTabIndex.value = index;
    page = 1;
    productList.value = [];
    getProductList();
  }

  void getProductList () async {
    if(isLoading || !hasMore.value) return;

    isLoading = true;
    var res = await request.get('/plist', queryParameters: {
      "page": page,
      "pageSize": pageSize,
      "sort": sort.value,
      "product_list": search,
      "cid": Get.arguments['cid'] ?? ''
    });
    var data = ProductDetailModel.fromJson(res.data);
    productList.addAll(data.result!);
    hasMore.value = data.result!.isNotEmpty;
    page++;
    isLoading = false;
  }

  @override
  void onInit() {
    super.onInit();
    getProductList();
    listenOffset();
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
