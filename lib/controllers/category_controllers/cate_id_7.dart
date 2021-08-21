import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_1.dart';
import 'package:enie_production/screens/category/category_1.dart';
import 'package:enie_production/screens/category/category_7.dart';
import 'package:get/state_manager.dart';

class CateId7Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate7();
    super.onInit();
  }

  void fetchCate7() async {
    try {
      isLoading(true);
      var products = await Cate7State.fetchCate7();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}