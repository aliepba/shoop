import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoop/models/cart_model.dart';
import 'package:shoop/models/transaction_model.dart';

class TransactionService {
  String baseUrl = 'http://10.0.2.2:3000';

  Future<bool> checkout(String token, List<CartModel> carts) async {
    var url = '$baseUrl/order/create';
    var headers = {'Content-Type': 'application/json', 'Authorization': token};

    var body = jsonEncode({
      'payment': 'COD(Duel Di Tempat)',
      'status': 'PENDING',
      'address': 'tokyooo',
      'shippingPrice': 50000,
      'detail': carts
          .map((cart) =>
              {'productId': cart.product.id, 'quantity': cart.quantity})
          .toList()
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to checkout');
    }
  }

  Future<List<TransactionModel>> getHistory(String token) async {
    var url = '$baseUrl/transaction/history';
    var headers = {'Content-Type': 'application/json', 'Authorization': token};

    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<TransactionModel> transactions = [];
      for (var item in data) {
        transactions.add(TransactionModel.fromJson(item));
      }
      print(transactions);
      return transactions;
    } else {
      throw Exception('Failed to get transaction');
    }
  }
}
