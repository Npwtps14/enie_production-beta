import 'package:chopper/chopper.dart';
import 'package:enie_production/models/cart.dart';
import 'package:enie_production/models/cart_list.dart';
import 'package:enie_production/screens/nav_bar.dart';
import 'package:enie_production/services/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helpers/shared_preferance.dart';
import 'json_serializable_converter.dart';
import 'models/user.dart';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: NavBar());
//   }
// }
// void main() {
//   runApp(MaterialApp(initialRoute: '/loginScreen', //root page
//       routes: {
//         '/loginScreen': (context) => Login(),
//         '/productScreen': (context) => NavBar(),
//       }));
// }
//
Future<Request> authHeaderRequestInterceptor(Request request) async {
  final headers = Map<String, String>.from(request.headers);

  headers['apiKey'] = 'TU2WQYVkxjz+FNH9ZJIEv4OAvXs=';
// TU2WQYVkxjz+FNH9ZJIEv4OAvXs=
  request = request.copyWith(headers: headers);
  return request;
}

void setupLocator() {
  GetIt.I.registerLazySingleton(() => CartsService.create(ChopperClient(
        baseUrl: CartsService.API,
        converter: JsonSerializableConverter(
            {Cart: Cart.fromJson, CartList: CartList.fromJson}),
        interceptors: [authHeaderRequestInterceptor],
      )));
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  SharedPreferences sharedPreferences;
  Widget build(BuildContext context) {
    Future<User> getUserData() => UserPreferences().getUser();
    return MaterialApp(
      title: 'Enie Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            return NavBar();
          }),
    );
  }
}
