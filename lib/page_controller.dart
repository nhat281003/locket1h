import 'package:clone_locket/model/item_lock.dart';
import 'package:get/get.dart';

class Page2Controller extends GetxController{
  List<String> item = [
    "minh nhat nguyen",
    "minh nhat nguyen",
    "minh nhat nguyen",
    "minh nhat nguyen",
    "minh nhat nguyen",
    "minh nhat nguyen",
  ];
  var selectValue = "".obs;


  List<ItemLock> itemlock = [
    ItemLock(image: "image/quyt.jpg", name: "Quýt", content: "London nè",timeout: "1h"),
    ItemLock(image: "image/quyt.jpg", name: "Quýt", content: "London nè",timeout: "1h"),
    ItemLock(image: "image/kh.jpg", name: "Beezzy", content: "khánh hòa xin lũi mụi ngừi :)))",timeout: "12h"),
    ItemLock(image: "image/tvb.jpg", name: "Bấc", content: "Cười cc",timeout: "10h"),
    ItemLock(image: "image/tt.jpg", name: "phthaodayy", content: "mãi iu",timeout: "23h"),
    ItemLock(image: "image/daden.jpg", name: "Da đen", content: "nghiện",timeout: "1d"),
  ];

  @override
  void onInit() {

    super.onInit();
  }

}