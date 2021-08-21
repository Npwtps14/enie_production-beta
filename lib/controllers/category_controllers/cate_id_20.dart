import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_1.dart';
import 'package:enie_production/screens/category/category_20.dart';
import 'package:get/state_manager.dart';

class CateId20Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate20();
    super.onInit();
  }

  void fetchCate20() async {
    try {
      isLoading(true);
      var products = await Cate20State.fetchCate20();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}