import 'package:flutter/material.dart';
import 'package:shoop/models/cart_model.dart';
import 'package:shoop/services/transaction_service.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(String token, List<CartModel> carts) async {
    try {
      if (await TransactionService().checkout(token, carts)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
