import 'package:get/get.dart';
import 'package:xm_shop/app/models/category_model.dart';
import 'package:xm_shop/app/models/reclassify_model.dart';
import 'package:xm_shop/app/utils/request.dart';

class CategoryController extends GetxController {
  //TODO: Implement CategoryController
  RxInt currentIndex = 0.obs;
  RxList<CategoryItemModel> categoryList = <CategoryItemModel>[].obs;
  RxList<ReclassifyItemModel> reclassifyList = <ReclassifyItemModel>[].obs;



  // 获取以及分类
  void getCategoryList () async {
    var res = await request.get("/pcate");
    var category = CategoryModel.fromJson(res.data).result;
    categoryList.value = category!;
    getReclassifyList();
  }

  // 获取二级分类
  void getReclassifyList () async {
    var res = await request.get("/pcate",queryParameters: {
      "pid": categoryList[currentIndex.value].sId!
    });
    var reclassify = ReclassifyModel.fromJson(res.data).result;
    reclassifyList.value = reclassify!.map((item) {
      item.pic = '${IMAGE_URL}/${item.pic!.replaceAll("\\", "/")}';
      return item;
    }).toList();
  }

  void changeSelected (int index) {
    currentIndex.value = index;
    getReclassifyList();
  }


  @override
  void onInit() async {
    super.onInit();
    getCategoryList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
