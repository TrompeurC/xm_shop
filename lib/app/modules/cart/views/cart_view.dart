import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xm_shop/app/modules/cart/views/widgets/cart_app_bar.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppBar(),
      body: const Center(
        child: Text(
          'CartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
