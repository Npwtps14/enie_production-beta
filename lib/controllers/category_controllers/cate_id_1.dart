import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_1.dart';
import 'package:get/state_manager.dart';

class CateId1Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate1();
    super.onInit();
  }

  void fetchCate1() async {
    try {
      isLoading(true);
      var products = await Cate1State.fetchCate1();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}