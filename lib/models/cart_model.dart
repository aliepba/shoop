import 'package:shoop/models/product_model.dart';

class CartModel {
  int id;
  ProductModel product;
  int quantity;

  CartModel({required this.id, required this.product, required this.quantity});

  CartModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        product = ProductModel.fromJson(json['product']),
        quantity = json['quantity'];

  Map<String, dynamic> toJson() {
    return {'id': id, 'product': product.toJson(), 'quantity': quantity};
  }

  double getTotalPrice() {
    return product.price * quantity;
  }
}
