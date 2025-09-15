import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:xm_shop/app/modules/home/controllers/home_controller.dart';
import 'package:xm_shop/app/routes/app_pages.dart';

import '../../../../utils/screen_adapter.dart';

class HomeWaterfall extends GetView<HomeController> {
  const HomeWaterfall({super.key});

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ScreenAdapter.width(20),
        horizontal: ScreenAdapter.width(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '省心优惠',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: ScreenAdapter.fontSize(46),
            ),
          ),
          Text(
            '全部优惠 >',
            style: TextStyle(
              color: Colors.black54,
              fontSize: ScreenAdapter.fontSize(38),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterfall() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(30)),
      child: Obx(
        () => MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: ScreenAdapter.width(30),
          crossAxisSpacing: ScreenAdapter.height(20),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.waterfallProductList.length,
          itemBuilder: (context, index) {
            var item = controller.waterfallProductList[index];
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {
                  "id": item.cid,
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(246, 246, 246, 1),
                  borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
                ),
                child: Column(
                  children: [
                    Image.network(item.pic!, fit: BoxFit.cover),
                    Padding(
                      padding: EdgeInsets.all(ScreenAdapter.width(30)),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              item.title!,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: ScreenAdapter.fontSize(46),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          if (item.subTitle != "")
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                item.subTitle!,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: ScreenAdapter.fontSize(32),
                                ),
                              ),
                            ),
                          if (item.subTitle != "") SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "¥${item.price!}",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: ScreenAdapter.fontSize(38),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [_buildTitle(), _buildWaterfall()]);
  }
}
