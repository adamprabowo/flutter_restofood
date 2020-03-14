
import 'dart:io';
import 'package:dio/dio.dart';

class CartModel {
  String id;
  String username;
  int foods_id;
  int qty;


  CartModel({
    this.id, this.foods_id, this.qty, this.username
  });

  //Converter dari map ke object
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'].toString(),
      username: json['username'],
      foods_id: json['foods_id'],
      qty: json['qty']
    );
  }

  //Converter dari object ke map
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = id;
		}
		map['username'] = username;
		map['foods_id'] = foods_id;
    map['qty'] = qty;
		
		return map;
  }
}

class CartResponse {
  int status;
  String message;

  CartResponse({this.status, this.message});

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      status: int.parse(json['status'].toString()),
      message: json['message']
    );
  }
}