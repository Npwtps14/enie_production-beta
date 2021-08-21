import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_1.dart';
import 'package:enie_production/screens/category/category_19.dart';
import 'package:get/state_manager.dart';

class CateId19Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate19();
    super.onInit();
  }

  void fetchCate19() async {
    try {
      isLoading(true);
      var products = await Cate19State.fetchCate19();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}