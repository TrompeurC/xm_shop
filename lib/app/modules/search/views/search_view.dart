import 'package:flutter/material.dart' hide SearchController;

import 'package:get/get.dart';
import 'package:xm_shop/app/modules/search/views/widgets/search_app_bar.dart';
import 'package:xm_shop/app/modules/search/views/widgets/search_product_list.dart';
import 'package:xm_shop/app/modules/search/views/widgets/search_tabs.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({super.key});
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
          Positioned(top: 0, left: 0, right: 0, child: SearchTabs()),
        ],
      ),
    );
  }
}
