import 'package:enie_production/models/cart.dart';
import 'package:enie_production/models/cart_list.dart';
import 'package:chopper/chopper.dart';

part 'cart_service.chopper.dart';

// @ChopperApi(baseUrl: "/notes")
@ChopperApi(baseUrl: "/salon-carts")
abstract class CartsService extends ChopperService {
  static CartsService create([ChopperClient client]) => _$CartsService(client);

  // static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
  static const API = 'https://app1.fantasy.co.th';

  // @Get(path: '{user_id}')
  // Future<Response<List<NoteForListing>>> getNotesList(@Part()String user_id );

  @Get()
  Future<Response<List<CartList>>> getCartsList();

  @Get(path: '{user_id}')
  Future<Response<Cart>> getCart(@Path() String user_id);

  // @Post()
  // Future<Response<Cart>> createNote(@Body() NoteManipulation item);

  // @Put(path: '{id}')
  // Future<Response> updateNote(@Path() String id, @Body() NoteManipulation item);

  @Delete(path: '{id}')
  Future<Response> deleteCart(@Path() String id);
}
