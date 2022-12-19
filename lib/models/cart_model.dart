import 'package:shamo/models/product_model.dart';

class CartModel {
  int? id;
  ProductModel? product;
  late int quantity;

  CartModel({
    this.id,
    this.product,
    this.quantity = 0,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = ProductModel.fromJson(json['product']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product!.toJson(),
      'quantity': quantity,
    };
  }

  // Function untuk menghitung total harga
  double getTotalPrice() {
    return product!.price! * quantity;
  }
}
