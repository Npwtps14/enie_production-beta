// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) {
  return Cart(
    productID: json['productID'] as int,
    userID: json['userID'] as int,
    id: json['id'] as int,
    itemCount: json['itemCount'] as int,
    status: json['status'] as int,
    productPrice: (json['productPrice'] as num)?.toDouble(),
    productImg: json['productImg'] as String,
  );
}

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'productID': instance.productID,
      'productPrice': instance.productPrice,
      'itemCount': instance.itemCount,
      'status': instance.status,
      'productImg': instance.productImg,
    };
