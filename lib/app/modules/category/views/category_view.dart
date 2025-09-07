import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategoryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Scrollbar(child: ListView(
            children: List.generate(100, (int index) => ListTile(
              title: Text("$index"),
            ))),
        ),
      ),
    );
  }
}
