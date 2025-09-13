import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/search/controllers/search_controller.dart';
import 'package:xm_shop/app/utils/local_storage.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

import '../../../../routes/app_pages.dart';

class SearchAppBar extends GetView<SearchController>
    implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  void _gotoProductListView() async {
    if (controller.search.value != "") {
       controller.addList("history", controller.search.value);
    }
    Get.offAndToNamed(
      Routes.PRODUCT_LIST,
      arguments: {"search": controller.search.value},
    );
  }

  Widget _buildInput() {
    return Container(
      width: ScreenAdapter.width(840),
      height: ScreenAdapter.height(86),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey),
        color: const Color.fromRGBO(246, 246, 246, 1),
      ),
      child: TextField(
        autofocus: true,
        style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
        decoration: InputDecoration(
          contentPadding: EdgeInsetsGeometry.all(0),
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (val) => controller.search.value = val,
        onSubmitted: (val) => _gotoProductListView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      title: _buildInput(),
      actions: [
        TextButton(
          onPressed: _gotoProductListView,
          child: Text('搜索', style: TextStyle(color: Colors.black87)),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, ScreenAdapter.height(126));
}
