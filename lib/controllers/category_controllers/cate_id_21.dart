import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_1.dart';
import 'package:enie_production/screens/category/category_21.dart';
import 'package:get/state_manager.dart';

class CateId21Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate21();
    super.onInit();
  }

  void fetchCate21() async {
    try {
      isLoading(true);
      var products = await Cate21State.fetchCate21();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}