import 'package:enie_production/models/product.dart';
import 'package:enie_production/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_screen.dart';

// ignore: must_be_immutable
class ProductTile extends StatelessWidget {
  Product product;
  ProductTile(this.product);
  final itemCount = 1;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print('Img Url  '+'https://office.enie.co.th/images/product/800/'+product.pdMainImage);
        var itemDetail = new MaterialPageRoute(
            builder: (BuildContext contex) => GetItem(
                itemId: product.id,
                itemName: product.pdNameTh,
                itemDetail: product.pdDetail,
                itemImg: product.pdMainImage,
                itemPrice: product.pdPriceSalon,
                itemCapacity: product.pdCapacity,
                itemHowToUse: product.pdHowToUse));
        Navigator.of(context).push(itemDetail);
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network(
                     'https://office.enie.co.th/images/product/800/'+product.pdMainImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Obx(() => CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: product.isFavorite.value
                                ? Icon(Icons.favorite_rounded)
                                : Icon(Icons.favorite_border),
                            onPressed: () {
                              product.isFavorite.toggle();
                            },
                          ),
                        )),
                  )
                ],
              ),
              SizedBox(height: 8),
              Text(
                product.pdNameTh,
                maxLines: 2,
                style: TextStyle(
                    fontFamily: 'avenir', fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              if (product.isBlank != null)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '  ${product.pdPriceSalon}' + ' บาท  ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 8),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  // child: addCartBtn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
