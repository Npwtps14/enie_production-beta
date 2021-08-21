import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_14.dart';
import 'package:enie_production/screens/category/category_1.dart';
import 'package:get/state_manager.dart';

class CateId14Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate14();
    super.onInit();
  }

  void fetchCate14() async {
    try {
      isLoading(true);
      var products = await Cate14State.fetchCate14();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}