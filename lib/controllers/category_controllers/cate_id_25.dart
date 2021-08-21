import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_1.dart';
import 'package:enie_production/screens/category/category_25.dart';
import 'package:get/state_manager.dart';

class CateId25Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate25();
    super.onInit();
  }

  void fetchCate25() async {
    try {
      isLoading(true);
      var products = await Cate25State.fetchCate25();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}