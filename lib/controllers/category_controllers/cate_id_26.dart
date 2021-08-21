import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_1.dart';
import 'package:enie_production/screens/category/category_26.dart';
import 'package:get/state_manager.dart';

class CateId26Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate26();
    super.onInit();
  }

  void fetchCate26() async {
    try {
      isLoading(true);
      var products = await Cate26State.fetchCate26();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}