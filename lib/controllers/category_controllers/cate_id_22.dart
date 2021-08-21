import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_1.dart';
import 'package:enie_production/screens/category/category_22.dart';
import 'package:get/state_manager.dart';

class CateId22Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate22();
    super.onInit();
  }

  void fetchCate22() async {
    try {
      isLoading(true);
      var products = await Cate22State.fetchCate22();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}