import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:xm_shop/app/routes/app_pages.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

import '../../../../utils/icon_font.dart';

class CategoryAppBar extends StatelessWidget  implements PreferredSizeWidget{
  const CategoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: ScreenAdapter.width(100),
      leading: Text(""),
      scrolledUnderElevation:0,
      title: InkWell(
        onTap: () {
          Get.toNamed(Routes.SEARCH);
        },
        child: Container(
          height: ScreenAdapter.height(96),
          padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: const BorderRadiusGeometry.all(Radius.circular(30)),
          ),
          child: Row(
            children: [
              Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[400]),
                  SizedBox(width: 4),
                  Text(
                    '搜索商品',
                    style: TextStyle(color: Colors.grey[400], fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        Badge(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          label: Text('1'),
          textStyle: TextStyle(fontSize: 14),
          offset: Offset(10, -4),
          child: Icon(IconFont.chat, size: 28, color: Colors.grey[400]),
        ),
        SizedBox(width: 20),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, ScreenAdapter.height(126));
}
