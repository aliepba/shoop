import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoop/models/product_model.dart';

class ProductService {
  String baseUrl = 'http://10.0.2.2:3000';

  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products/list';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Failed Get Products');
    }
  }
}
