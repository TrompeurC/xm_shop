import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/cart/views/cart_view.dart';
import 'package:xm_shop/app/modules/category/views/category_view.dart';
import 'package:xm_shop/app/modules/give/views/give_view.dart';
import 'package:xm_shop/app/modules/home/views/home_view.dart';
import 'package:xm_shop/app/modules/user/views/user_view.dart';
import '../../../common/widgets/keep_alive_wrapper.dart';


class TabsController extends GetxController {
  //TODO: Implement TabsController
  RxInt currentIndex = 0.obs;
  List<Widget> pages = [HomeView() , CategoryView(), GiveView(), CartView(),UserView()].map((widget) => KeepAliveWrapper( child: widget,)).toList();
  PageController pageController = PageController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setCurrentIndex (int index) {
    currentIndex.value = index;
  }

}
