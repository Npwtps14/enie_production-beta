import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  
  int id ;
  int userID ;
  int productID ;
  double productPrice ;
  int itemCount;
  int status;
  String productImg;
  
  Cart({ this.productID, this.userID, this.id, this.itemCount, this.status, this.productPrice, this.productImg});

  static const fromJson = _$CartFromJson;

//   factory Cart.fromJson(Map<String, dynamic> json) {
//   return Cart(
//     id: json['id'],
//     userID: json['user_id'],
//     productID: json['product_id'],
//     itemCount: json["item_count"],
//     status: json["status"],
//     productPrice: json['product_price'],
//     productImg: json["product_img"],
//     // createdAt: json["createdAt"],
//     // updatedAt: json["updatedAt"],
//   );
// }
  
}