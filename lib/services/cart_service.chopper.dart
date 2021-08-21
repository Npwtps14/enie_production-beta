// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$CartsService extends CartsService {
  var id = 1;

  _$CartsService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = CartsService;

  Future<Response<List<CartList>>> getCartsList() {
    final $url = '/salon-carts?user_id=$id&status=1';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<CartList>, CartList>($request);
  }

  Future<Response<Cart>> getCart(String user_id) {
    final $url = '/salon-carts/${user_id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Cart, Cart>($request);
  }

  Future<Response> deleteCart(String id) {
    final $url = '/salon-carts/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
