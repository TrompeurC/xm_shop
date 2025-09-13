import 'package:get/get.dart';
import 'package:xm_shop/app/utils/local_storage.dart';

class SearchController extends GetxController {
  //TODO: Implement SearchController
  RxString search = "".obs;
  RxList<String> historyList = <String>[].obs;
  RxList<String> guessWantList = <String>[].obs;


  void addList (String key , String value) async {
    var list = await LocalStorage.getStringList(key);
    var has = list.contains(value);
    print("-----" * 20);
    if(!has) {
      list.add(value);
      await LocalStorage.setStringList(key, list);
    }
    initData();
  }

  void removeList( String key) async {
    await LocalStorage.remove(key);
    initData();
  }

  Future<void> removeByString ( String key , String value) async {
    var list = await LocalStorage.getStringList(key);
    list = list.where((item) => item != value).toList();
    await LocalStorage.setStringList(key, list);
    print(list);
    print("object" * 20);
    initData();
  }
  void initData() async {
    historyList.value = await LocalStorage.getStringList("history");
    guessWantList.value = await LocalStorage.getStringList("guessWant");

  }
  @override
  void onInit() async {
    super.onInit();
    initData();
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
