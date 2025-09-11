import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

class CartAppBar extends StatelessWidget  implements PreferredSizeWidget{
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Container(
        height: ScreenAdapter.height(96),
        padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
        child: Row(
          children: [
            Row(
              children: [
                Icon(Icons.search, color: Colors.grey[400]),
                SizedBox(width: 4),
                Text(
                  '请搜索',
                  style: TextStyle(color: Colors.grey[400], fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => ScreenAdapter.height(96);
}
