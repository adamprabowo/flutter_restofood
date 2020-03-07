import 'package:dio/dio.dart';
import 'package:restofood_api/core/config/endpoint.dart';
import 'package:restofood_api/core/models/action_model.dart';


class AuthServices {

  static Dio dio = new Dio();
  static Future<ActionModel> register(Map registerData) async {
    var response = await dio.post(
      Endpoint.register,
      data: FormData.fromMap(registerData),
      options: Options(
        headers: {
          "Accept": "application/json"
        }
      )
    );

    return ActionModel.fromJson(response.data);
  }

  //untuk mendapatkan login 
   static Future<ActionModel> login2(Map loginData) async {
    var response = await dio.post(
      Endpoint.login,
      data: FormData.fromMap(loginData),
      options: Options(
        headers: {
          "Accept": "application/json"
        }
      )
    );

    return ActionModel.fromJson(response.data);
  }
}