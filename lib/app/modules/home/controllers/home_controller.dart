import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  ScrollController scrollController = ScrollController();
  RxBool isTop = true.obs;



  @override
  void onInit() {
    super.onInit();
    scrollController.addListener((){
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
