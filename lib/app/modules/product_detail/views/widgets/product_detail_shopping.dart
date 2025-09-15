import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/product_detail/controllers/product_detail_controller.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

class ProductDetailShopping extends GetView<ProductDetailController> {
  const ProductDetailShopping({super.key});

  Widget buildIconButton(Icon icon, String text) {
    return Column(
      children: [
        icon,
        Text(text, style: TextStyle(fontSize: ScreenAdapter.fontSize(34))),
      ],
    );
  }

  Widget _buildButtons() {
    return Expanded(
      flex: 1,
      child: Container(
        height: ScreenAdapter.height(96),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            // 加入购物车按钮
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFB347), Color(0xFFFFD700)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        '加入购物车',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenAdapter.fontSize(30),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // 立即购买按钮
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF6347), Color(0xFFFF4500)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        '立即购买',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenAdapter.fontSize(30),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenAdapter.height(126),

      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 20, right: 20),
      margin: EdgeInsets.only(bottom: ScreenAdapter.bottomBarHeight()),
      child: Row(
        spacing: 20,
        children: [
          buildIconButton(Icon(Icons.call), '客服'),
          buildIconButton(Icon(Icons.favorite_border), '收藏'),
          buildIconButton(Icon(Icons.shopping_cart), '购物车'),
          _buildButtons(),
        ],
      ),
    );
  }
}
