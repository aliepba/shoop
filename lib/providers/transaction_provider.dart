import 'package:flutter/material.dart';
import 'package:shoop/models/cart_model.dart';
import 'package:shoop/models/transaction_model.dart';
import 'package:shoop/services/transaction_service.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionModel> _transactions = [];
  List<TransactionModel> get transactions => _transactions;

  Future<bool> checkout(String token, List<CartModel> carts) async {
    try {
      if (await TransactionService().checkout(token, carts)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> getTransactions(String token) async {
    try {
      List<TransactionModel> transactions =
          await TransactionService().getHistory(token);
      _transactions = transactions;
    } catch (e) {
      print(e);
    }
  }
}
