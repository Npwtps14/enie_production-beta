// import 'package:enie_production/models/product.dart';
// import 'package:enie_production/screens/home_screen.dart';

// import 'package:flutter/foundation.dart';
// // import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';
// import 'dart:async';

// import 'package:flutter/material.dart';

// // class Category{

// // }
// class ProductsService  {
//   static Future<List<Product>> fetchProducts() async {
//     var dio = Dio();
//     var number = '1';
//     var categoryID = number;
//     var response = await dio
//         .get('https://api.enie.co.th/api/products?categoryID=${categoryID}');
//     if (response.statusCode == 200) {
//       // print(response.data);
//       return (response.data as List).map((x) => Product.fromJson(x)).toList();
//     } else {
//       //show error message
//       return null;
//     }
//   }

// }

// // ?categoryID=$categoryID
