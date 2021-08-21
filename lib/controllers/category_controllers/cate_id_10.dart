import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_1.dart';
import 'package:enie_production/screens/category/category_10.dart';
import 'package:get/state_manager.dart';

class CateId10Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate10();
    super.onInit();
  }

  void fetchCate10() async {
    try {
      isLoading(true);
      var products = await Cate10State.fetchCate10();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}