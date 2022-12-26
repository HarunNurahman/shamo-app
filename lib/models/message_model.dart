import 'dart:convert';

import 'package:shamo/models/product_model.dart';

class MessageModel {
  String? message;
  int? userId;
  String? username;
  String? userImg;
  bool? isFromUser;
  ProductModel? product;
  DateTime? createdAt;
  DateTime? updatedAt;

  MessageModel({
    this.message,
    this.userId,
    this.username,
    this.userImg,
    this.isFromUser,
    this.product,
    this.createdAt,
    this.updatedAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['userId'];
    username = json['username'];
    userImg = json['userImg'];
    isFromUser = json['isFromUser'];
    product = json['product'] == {}
        ? UninitializedProductModel()
        : ProductModel.fromJson(json['product']);
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'userId': userId,
        'username': username,
        'userImg': userImg,
        'isFromUser': isFromUser,
        'product':
            product is UninitializedProductModel ? {} : product!.toJson(),
        'createdAt': createdAt.toString(),
        'updatedAt': updatedAt.toString(),
      };
}
