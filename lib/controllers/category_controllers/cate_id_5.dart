import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/category/category_5.dart';
import 'package:get/state_manager.dart';

class CateId5Controller extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchCate5();
    super.onInit();
  }

  void fetchCate5() async {
    try {
      isLoading(true);
      var products = await Cate5State.fetchCate5();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}