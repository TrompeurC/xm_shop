import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/screen_adapter.dart';

class SearchAppBar extends GetView<SearchController> implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: 40,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      title: Container(
        width: ScreenAdapter.width(1000),
        height: ScreenAdapter.height(96),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(246, 246, 246, 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child:  Row(
          children: [
            SizedBox(width: 10),
            Icon(Icons.search, color: Colors.grey[400]),
            SizedBox(width: 4),
            Text(
              '搜索商品',
              style: TextStyle(color: Colors.grey[400], fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, ScreenAdapter.height(126));
}
