import 'package:flutter/cupertino.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;
  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  // Mengecek kembali apakah product sudah ada di cart atau belum
  addCart(ProductModel product) {
    // Apabila produknya ada, lalu mencari indeksnya
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product!.id == product.id);
      _carts[index].quantity++;
    } else {
      _carts.add(CartModel(
        id: _carts.length,
        product: product,
        quantity: 1,
      ));
    }

    notifyListeners();
  }

  // Fungsi untuk menghapus product dari cart
  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  // Fungsi untuk menambahkan quantity product yang dipesan
  addQuantity(int id) {
    _carts[id].quantity++;
    notifyListeners();
  }

  // Fungsi untuk mengurangi quantity product yang dipesan
  reduceQuantity(int id) {
    _carts[id].quantity--;
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  // Fungsi untuk menghitung total item
  totalItem() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

  // Fungsi untuk menghitung total harga
  totalPrice() {
    double total = 0.0;
    for (var item in _carts) {
      total += (item.quantity * item.product!.price!);
    }
    return total;
  }

  // Membuat function untuk mengecek apakah barang sudah masuk ke cart atau belum
  productExist(ProductModel product) {
    // Apabila product belum ada di cart
    if (_carts.indexWhere((element) => element.product!.id == product.id) ==
        -1) {
      return false;
    } else {
      // Apabila product sudah ada di cart
      return true;
    }
  }
}
