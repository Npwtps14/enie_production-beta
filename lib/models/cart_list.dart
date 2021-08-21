import 'package:json_annotation/json_annotation.dart';
import 'dart:ui';
part 'cart_list.g.dart';

@JsonSerializable()
class CartList {
  int id;
  int user_id;
  int product_id;
  int item_count;
  int status;
  int discount_id;
  int discount_amount;
  double product_price;
  String product_img;
  // ignore: non_constant_identifier_names
  String product_name;

  // double productPrice ;

  CartList(
      {this.id,
      this.user_id,
      this.product_id,
      this.item_count,
      this.status,
      this.product_price,
      this.product_img,
      this.discount_id,
      this.discount_amount,
      this.product_name
      });
  static const fromJson = _$CartListFromJson;

  // static const fromJson = _$CartListFromJson;
//   factory CartList.fromJson(Map<String, dynamic> json) {
//   return CartList(
//     id: json['id'],
//     user_id: json['user_id'],
//     product_id: json['product_id'],
//     item_count: json["item_count"],
//     status: json["status"],
//     product_price: json['product_price'],
//     product_img: json["product_img"],
//     product_name: json["product_name"],
//   );
// }
}
