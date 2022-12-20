import 'package:flutter/cupertino.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/services/transaction_service.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
      String token, List<CartModel> cart, double totalPrice) async {
    try {
      if (await TransactionService().checkout(token, cart, totalPrice)) {
        return true; // Memeriksa apakah semua nilainya sama atau ada
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
