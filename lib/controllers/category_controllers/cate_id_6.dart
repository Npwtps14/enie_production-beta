import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_6.dart';
import 'package:get/state_manager.dart';

class CateId6Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate6();
    super.onInit();
  }

  void fetchCate6() async {
    try {
      isLoading(true);
      var products = await Cate6State.fetchCate6();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}