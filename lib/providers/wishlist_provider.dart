import 'package:flutter/cupertino.dart';
import 'package:shamo/models/product_model.dart';

class WishlistProvider with ChangeNotifier {
  List<ProductModel> _wishlist = [];

  // Getter dan Setter
  List<ProductModel> get wishlist => _wishlist;
  set wishlist(List<ProductModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  // Function set product
  // Wishlist product ditambah atau dikurangi
  setProduct(ProductModel product) {
    if (!isWishlisted(product)) {
      // Jika tidak ada di wishlist
      _wishlist.add(product);
    } else {
      // Jika ada di wishlist
      _wishlist.removeWhere((element) => element.id == product.id);
    }
    notifyListeners();
  }

  // Function untuk mengecek apakah productnya ada di daftar wishlist kita atau tidak
  // Apabila product ada di daftar wishlist, maka akan dikurangi di wishlist
  // Apabila product tidak ada di daftar wishlist, maka wishlist akan ditambah
  isWishlisted(ProductModel product) {
    if (_wishlist.indexWhere((element) => element.id == product.id) == -1) {
      return false; // Tidak ada di wishlist
    } else {
      return true; // Ada di wishlist
    }
  }
}
