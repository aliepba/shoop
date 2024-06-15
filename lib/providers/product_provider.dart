import 'package:flutter/material.dart';
import 'package:shoop/models/product_model.dart';
import 'package:shoop/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> _wishlist = [];
  List<ProductModel> get products => _products;
  List<ProductModel> get wishlist => _wishlist;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  set wishlist(List<ProductModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _products = products;
    } catch (e) {
      print(e);
    }
  }

  setProduct(ProductModel product) {
    if (!isWishList(product)) {
      _wishlist.add(product);
    } else {
      _wishlist.removeWhere((element) => element.id == product.id);
    }

    notifyListeners();
  }

  isWishList(ProductModel product) {
    if (_wishlist.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
