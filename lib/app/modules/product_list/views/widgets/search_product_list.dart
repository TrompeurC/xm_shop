import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/product_list/controllers/product_list_controller.dart';
import 'package:xm_shop/app/utils/request.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

import '../../../../models/product_detail_model.dart';

class SearchProductList extends GetView<ProductListController> {
  const SearchProductList({super.key});

  Widget _buildProduct(ProductDetailItemModel product, int index) {
    var typeList = [
      {"type": 'CPU', "value": '天机960'},
      {"type": '双摄像头', "value": '5000万+'},
      {"type": '超大屏', "value": '6.6英寸'},
    ];
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 40),
          width: ScreenAdapter.width(400),
          child: Image.network(getUri(product.pic!), fit: BoxFit.fitHeight),
        ),
        SizedBox(width: ScreenAdapter.width(20)),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 20, top: 20, bottom: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  product.title!,
                  style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(46),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(width: ScreenAdapter.height(20)),
                Text(product.subTitle!, style: TextStyle(color: Colors.grey)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: typeList.asMap().entries.map((item) {
                    return Column(
                      spacing: 10,
                      children: [
                        Text(item.value['type']!),
                        Text(item.value['value']!),
                      ],
                    );
                  }).toList(),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: ScreenAdapter.fontSize(26),
                    ),
                    children: [
                      TextSpan(text: '¥'),
                      TextSpan(
                        text: "${product.price}",
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(46)),
                      ),
                      TextSpan(text: "起"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.productList.isEmpty && controller.hasMore.value) {
        return Container(
          color: Colors.white,
          child: Center(child: CupertinoActivityIndicator()),
        );
      }
      return Container(
        padding: EdgeInsets.only(top: ScreenAdapter.height(120)),
        color: const Color.fromRGBO(246, 246, 246, 1),
        child: Obx(
          () => ListView.separated(
            separatorBuilder: (context, index) =>
                SizedBox(height: ScreenAdapter.height(20)),
            itemCount: controller.productList.length,
            controller: controller.scrollController,
            itemBuilder: (context, index) {
              var item = controller.productList[index];
              return Obx(() => Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenAdapter.width(20),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _buildProduct(item, index),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: (!controller.hasMore.value && index == controller.productList.length)
                        ? Text('没有数据了')
                        : (index != controller.productList.length && !controller.hasMore.value) ? SizedBox() : CupertinoActivityIndicator(),
                  ),
                ],
              ));
            },
          ),
        ),
      );
    });
  }
}
