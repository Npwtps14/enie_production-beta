import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_4.dart';
import 'package:get/state_manager.dart';

class CateId4Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate4();
    super.onInit();
  }

  void fetchCate4() async {
    try {
      isLoading(true);
      var products = await Cate4State.fetchCate4();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}