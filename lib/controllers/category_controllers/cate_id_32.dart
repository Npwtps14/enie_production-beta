import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_1.dart';
import 'package:enie_production/screens/category/category_32.dart';
import 'package:get/state_manager.dart';

class CateId32Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate32();
    super.onInit();
  }

  void fetchCate32() async {
    try {
      isLoading(true);
      var products = await Cate32State.fetchCate32();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}