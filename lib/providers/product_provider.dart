import 'package:flutter/cupertino.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  // Inisialisasi dengan list kosong
  List<ProductModel> _products = [];

  // Getter dan Setter
  // Get products dan dikembalikan ke _products (Product Model)
  List<ProductModel> get products => _products;
  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  // Function untuk mengambil data product
  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductServices().getProducts();
      _products = products;
    } catch (e) {
      print(e);
    }
  }
}
