import 'package:flutter/material.dart' hide SearchController;

import 'package:get/get.dart';
import 'package:xm_shop/app/modules/product_list/views/widgets/search_product_app_bar.dart';
import 'package:xm_shop/app/modules/product_list/views/widgets/search_product_list.dart';
import 'package:xm_shop/app/modules/product_list/views/widgets/search_product_tabs.dart';

import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      key: controller.scaffoldKey,
      endDrawer: const Drawer(
        child: DrawerHeader(
          child: Text("右侧筛选"),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: SearchProductList(),
          ),
          Positioned(top: 0, left: 0, right: 0, child: SearchProductTabs()),
        ],
      ),
    );
  }
}
