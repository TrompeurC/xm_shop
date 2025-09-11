import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xm_shop/app/modules/category/views/widgets/category_app_bar.dart';
import 'package:xm_shop/app/modules/category/views/widgets/category_body.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppBar(),
      body: CategoryBody(),
    );
  }
}
