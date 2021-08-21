import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_11.dart';
import 'package:enie_production/screens/category/category_1.dart';
import 'package:get/state_manager.dart';

class CateId11Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate11();
    super.onInit();
  }

  void fetchCate11() async {
    try {
      isLoading(true);
      var products = await Cate11State.fetchCate11();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}