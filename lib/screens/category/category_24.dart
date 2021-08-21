import 'package:dio/dio.dart';
import 'package:enie_production/controllers/category_controllers/cate_id_10.dart';
import 'package:enie_production/controllers/category_controllers/cate_id_20.dart';
import 'package:enie_production/controllers/category_controllers/cate_id_24.dart';
import 'package:enie_production/controllers/category_controllers/cate_id_4.dart';
import 'package:enie_production/controllers/category_controllers/cate_id_8.dart';
import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/cart_screen.dart';
import 'package:enie_production/screens/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class Cate24 extends StatefulWidget {
  final cate;
  final cateId;
  const Cate24({String this.cate, String this.cateId});
  @override
  Cate24State createState() => new Cate24State();
}

class Cate24State extends State<Cate24> {
  @override
  final CateId24Controller productController = Get.put(CateId24Controller());

  // final ProductsPage productsPage = ProductsPage().cateId;

  static get cateId => Cate24().cateId;

  static Future<List<Product>> fetchCate24() async {
    @override
    var dio = Dio();
    var id = 24;
    // var cateId = id;

    //  id.widget.cateId;

    var response = await dio
        // ignore: unnecessary_brace_in_string_interps
        // 'https://api.enie.co.th/api/products'

        .get('https://app1.fantasy.co.th/products?product_category_id=$id&pd_status=1');
    if (response.statusCode == 200) {
      print('value ${id}');
      return (response.data as List).map((x) => Product.fromJson(x)).toList();
    } else {
      //show error message
      return null;
    }
  }

  Widget build(BuildContext context) {
    // TODO: implement build

    return WillPopScope(
        onWillPop: () {
          return new Future(() => true);
        },
        child: Scaffold(
                    backgroundColor: HexColor('#e0e0e0'),

          resizeToAvoidBottomInset: false, //remove warnning pixel
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text('สินค้า', style: GoogleFonts.kanit()),
            backgroundColor: HexColor('#36803a'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: new Text(
                        widget.cate,
                        style: GoogleFonts.kanit(
                            fontSize: 32, fontWeight: FontWeight.w400),
                      ),
                    ),
                    IconButton(
                        icon: LineIcon(LineIcons.shoppingCart),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartPage()),
                          );
                        }),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (productController.isLoading.value)
                    return Center(child: CircularProgressIndicator());
                  else
                    return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: productController.productList.length,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      itemBuilder: (context, index) {
                        return ProductTile(
                            productController.productList[index]);
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    );
                }),
              )
            ],
          ),
        ));
  }
}
