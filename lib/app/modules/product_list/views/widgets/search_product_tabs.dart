import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/product_list/controllers/product_list_controller.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

class SearchProductTabs extends GetView<ProductListController> {
  const SearchProductTabs({super.key});

  @override
  Widget build(BuildContext context) {

    Widget _buildSort(int index) {
      var sort = controller.sort;
      if(index == controller.currentTabIndex.value && index != 0) {
        return Row(
          children: [
             Icon(sort.value.contains("-1") ? Icons.arrow_drop_down : Icons.arrow_drop_up)
          ],
        );
      }
      return SizedBox();
    }

    return Obx(
      () => Container(
        height: ScreenAdapter.height(120),
        width: ScreenAdapter.width(1080),
        color: Colors.white,
        child: Row(
          children: controller.tabs
              .asMap()
              .entries
              .map(
                (item) => Expanded(
                  child: Center(
                    child: item.value == '筛选'
                        ? Center(
                            child: InkWell(
                              onTap: () {
                                controller.scaffoldKey.currentState!.openEndDrawer();
                              },
                              child: Container(
                                width: double.infinity,
                                height: 18,
                                decoration: BoxDecoration(
                                  border: BoxBorder.fromLTRB(left: BorderSide()),
                                ),
                                child: Center(child: Text(item.value)),
                              ),
                            ),
                          )
                        : InkWell(
                      onTap: () {
                        controller.changeTabIndex(item.key);
                      },
                          child: SizedBox(
                            width: double.infinity,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item.value,
                                    style: TextStyle(
                                      color:
                                          controller.currentTabIndex.value == item.key
                                          ? Colors.red
                                          : null,
                                    ),
                                  ),
                                  _buildSort(item.key),
                                ],
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
