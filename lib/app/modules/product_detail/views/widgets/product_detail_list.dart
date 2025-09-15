import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/product_detail/controllers/product_detail_controller.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

class ProductDetailList extends GetView<ProductDetailController> {
  const ProductDetailList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          Container(
            key: controller.globalKey1,
            height: 600,
            color: Colors.red,
            child: Center(
              child: Text('商品'),
            ),
          ),
          Container(
            height: 600,
            key: controller.globalKey2,
            color: Colors.white,
            child: Center(
              child: Text('详情'),
            ),
          ),
          Container(
            height: 600,
            color: Colors.white,
            key: controller.globalKey3,
            child: Center(
              child: Text('推荐'),
            ),
          ),
          SizedBox(
            height: ScreenAdapter.height(140),
          )
        ],
      ),
    );
  }
}
