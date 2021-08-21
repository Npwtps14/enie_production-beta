import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_1.dart';
import 'package:enie_production/screens/category/category_29.dart';
import 'package:get/state_manager.dart';

class CateId29Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate29();
    super.onInit();
  }

  void fetchCate29() async {
    try {
      isLoading(true);
      var products = await Cate29State.fetchCate29();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}