import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/search/controllers/search_controller.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

class SearchWant extends GetView<SearchController> {
  final String title;
  final Widget icon;
  final List<String> list;
  final ValueChanged<String> onLongPressItem;
  final ValueChanged<String> onTaoItem;

  const SearchWant({
    super.key,
    required this.title,
    required this.icon,
    required this.list,
    required this.onLongPressItem,
    required this.onTaoItem
  });

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: ScreenAdapter.fontSize(40),
              fontWeight: FontWeight.bold,
            ),
          ),
          icon,
        ],
      ),
    );
  }

  Widget _buildList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Wrap(
        children: list
            .map(
              (item) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4)
                ),
                margin: EdgeInsets.only(right: 20, bottom: 10),
                child: InkWell(
                  onLongPress: () => onLongPressItem(item),
                  onTap: () => onTaoItem(item),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Text(
                      item,
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildTitle(), _buildList()],
    ));
  }
}
