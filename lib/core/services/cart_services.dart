
import 'package:restofood_api/core/config/endpoint.dart';
import 'package:dio/dio.dart';
import 'package:restofood_api/core/models/cart_model.dart';

class CartServices {
  static Dio dio = new Dio();

  static Future<List<CartModel>> getAll() async {
    var response = await dio.get(
      Endpoint.baseCart,
      options: Options(
        headers: {
          "Accept": "application/json"
        }
      )
    );

    var _cartData = List<CartModel>();
    response.data["data"].forEach((value) {
      _cartData.add(CartModel.fromJson(value));
    });
    print(_cartData);

    return _cartData;
  }

  static Future<CartResponse> createCart(CartModel cartModel) async {
    var response = await dio.post(
      Endpoint.baseCart,
      data: FormData.fromMap(cartModel.toMap()),
      options: Options(
        headers: {
          "Accept": "application/json"
        }
      )
    );

    return CartResponse.fromJson(response.data);
  }

  static Future<CartResponse> updateCart(CartModel cartModel, String id) async {
    
    var foodData = cartModel.toMap();
    foodData['_method'] = "PUT";

    var response = await dio.post(
      Endpoint.baseCart + "/${id}",
      data: FormData.fromMap(foodData),
      options: Options(
        headers: {
          "Accept": "application/json",
        }
      )
    );
    
    return CartResponse.fromJson(response.data);
  }

  static Future<CartResponse> deleteCart(String username) async {
    var response = await dio.delete(
      Endpoint.baseCart + '/${username}',
      options: Options(
        headers: {
          "Accept": "application/json"
        }
      )
    );

    return CartResponse.fromJson(response.data);
  }
}