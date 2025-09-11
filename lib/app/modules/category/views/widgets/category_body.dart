import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/category/controllers/category_controller.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

class CategoryBody extends GetView<CategoryController> {
  const CategoryBody({super.key});

  Widget _buildCategory() {
    return Obx(
      () => Container(
        width: ScreenAdapter.width(280),
        height: double.infinity,
        decoration: BoxDecoration(),
        child: ListView.builder(
          itemCount: controller.categoryList.length,
          itemBuilder: (context, index) {
            var item = controller.categoryList[index];
            return Obx(
              () => InkWell(
                onTap: () => controller.changeSelected(index),
                child: SizedBox(
                  height: ScreenAdapter.height(180),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: ScreenAdapter.width(10),
                          ),
                          height: ScreenAdapter.height(46),
                          width: ScreenAdapter.width(10),
                          decoration: controller.currentIndex.value == index
                              ? BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                )
                              : null,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          item.title!,
                          style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(36),
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildReclassify() {
    return Obx(
      () => Expanded(
        flex: 1,
        child: SizedBox(
          height: double.infinity,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: ScreenAdapter.width(20),
              crossAxisSpacing: ScreenAdapter.height(30),
              childAspectRatio: 240 / 340,
            ),
            itemCount: controller.reclassifyList.length,
            itemBuilder: (context, index) {
              var item = controller.reclassifyList[index];
              return Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Column(
                  children: [
                    Image.network(item.pic!, fit: BoxFit.fitHeight),
                    SizedBox(height: ScreenAdapter.height(20)),
                    Text(
                      item.title!,
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCategory(),
        SizedBox(width: ScreenAdapter.width(20)),
        _buildReclassify(),
      ],
    );
  }
}
