import 'package:flutter/material.dart' hide SearchController;

import 'package:get/get.dart';
import 'package:xm_shop/app/modules/search/views/widgets/search_app_bar.dart';
import 'package:xm_shop/app/modules/search/views/widgets/search_want.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

import '../../../routes/app_pages.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({super.key});

  void removeAll(String key) {
    Get.defaultDialog(
      title: "确定要删除全部吗？",
      titleStyle: TextStyle(fontSize: ScreenAdapter.fontSize(40)),
      content: SizedBox(height: 0),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("取消"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                controller.removeList(key);
                Get.back();
              },
              child: const Text("确定"),
            ),
          ],
        ),
      ],
    );
  }

  void removeByString(String key, String value) async {
    Get.defaultDialog(
      title: "确定要删除吗?",
      content: SizedBox(),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: 10),
            ElevatedButton(onPressed: () => Get.back(), child: Text('取消')),

            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                controller.removeByString(key, value);
              },
              child: Text('确定'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      body: Obx(
        () => ListView(
          children: [
            if (controller.historyList.isNotEmpty)
              SearchWant(
                title: "搜索历史",
                icon: InkWell(
                  child: Icon(Icons.delete, size: 20, color: Colors.grey),
                  onTap: () => removeAll("history"),
                ),
                onLongPressItem: (value) => removeByString("history", value),
                list: controller.historyList,
                onTaoItem: (value) => Get.offAndToNamed(Routes.PRODUCT_LIST, arguments: {
                  "search": value
                }),
              ),
            if (controller.guessWantList.isNotEmpty)
              SearchWant(
                title: "猜你想要",
                icon: Icon(Icons.refresh, size: 20, color: Colors.grey),
                onLongPressItem: (value) => removeByString("guessWant", value),
                list: controller.guessWantList,
                  onTaoItem: (value) => Get.offAndToNamed(Routes.PRODUCT_LIST, arguments: {
                    "search": value
                  })
              ),
          ],
        ),
      ),
    );
  }
}
