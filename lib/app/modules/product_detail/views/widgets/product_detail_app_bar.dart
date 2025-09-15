import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/product_detail/controllers/product_detail_controller.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

class ProductDetailAppBar extends GetView<ProductDetailController>
    implements PreferredSizeWidget {
  const ProductDetailAppBar({super.key});

  Widget _buildIcon(Icon icon, VoidCallback onTap) {
    return Container(
      width: ScreenAdapter.width(80),
      height: ScreenAdapter.width(80),
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.all(0)),
          backgroundColor: WidgetStateProperty.all(
            Colors.black.withValues(alpha: 0.1),
          ),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(CircleBorder()),
        ),
        child: icon,
      ),
    );
  }

  PopupMenuItem _buildMenuItem (Icon icon , String text , VoidCallback onTap) {
    return PopupMenuItem(
      child: Row(
        children: [
          icon,
          SizedBox(width: 10,),
          Text(text ,style: TextStyle(
            fontSize: ScreenAdapter.height(36),
            color: Colors.white
          ),)
        ],
      ),
    );
  }

  void _buildMenu (BuildContext context) {
     showMenu(
        color: Colors.black.withValues(alpha: .1),
        context: context,
        position: RelativeRect.fromLTRB(ScreenAdapter.width(800), ScreenAdapter.height(280), ScreenAdapter.width(20),0),
        items: [
          _buildMenuItem(Icon(Icons.home,color: Colors.white,), "首页", () {}),
          _buildMenuItem(Icon(Icons.messenger_outline,color: Colors.white,), "消息", () {}),
          _buildMenuItem(Icon(Icons.share_outlined,color: Colors.white,), "分享", () {}),
        ]
    );
  }

  Widget _buildTitle () {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: controller.tabs.asMap().entries.map((item)  {
        return InkWell(
          onTap: () => controller.changeSelectedIndex(item.key),
          child:
          Column(
            children: [
              if(controller.showTitle.value)
              Text("${item.value}", style: TextStyle(
                  fontSize: ScreenAdapter.fontSize(42),
                  color: controller.selectedIndex.value == item.key ?  Colors.red : Colors.black,
              ),),
              SizedBox(height: 4,),
              if(controller.showTitle.value)
              Container(
                width: ScreenAdapter.width(100),
                height: 2,
                color: controller.selectedIndex.value == item.key ?  Colors.red : Colors.white,
              )
            ],
          ),
        );
      }).toList(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppBar(
      elevation: 0,
      backgroundColor: Colors.white.withValues(alpha: controller.opacity.value),
      scrolledUnderElevation: 0,
      leading: Container(
        margin: EdgeInsets.only(left: 20),
        child: _buildIcon(Icon(Icons.arrow_back_ios_new_outlined), () {
          Get.back();
        }),
      ),
      leadingWidth: ScreenAdapter.width(126),
      actions: [
        _buildIcon(Icon(Icons.upload), () {}),
        SizedBox(width: 10),
        _buildIcon(Icon(Icons.more_horiz_outlined), () {
          _buildMenu(context);
        }),
        SizedBox(width: 10),
      ],
      centerTitle: true,
      title: _buildTitle(),
      // leading: ,
    ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(ScreenAdapter.height(126));
}
