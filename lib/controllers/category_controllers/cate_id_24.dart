import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_1.dart';
import 'package:enie_production/screens/category/category_24.dart';
import 'package:get/state_manager.dart';

class CateId24Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate24();
    super.onInit();
  }

  void fetchCate24() async {
    try {
      isLoading(true);
      var products = await Cate24State.fetchCate24();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}