import 'package:shoop/models/category_model.dart';

class ProductModel {
  int id;
  String name;
  double price;
  String description;
  String tags;
  CategoryModel category;
  DateTime createdAt;
  DateTime updatedAt;

  ProductModel({
    this.id = 0,
    this.name = '',
    this.price = 0.0,
    CategoryModel? category,
    this.tags = '',
    this.description = '',
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : category = category ?? CategoryModel.empty(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = double.parse(json['price'].toString()),
        description = json['description'],
        tags = json['tags'],
        category = CategoryModel.fromJson(json['category']),
        createdAt = DateTime.parse(json['createdAt']),
        updatedAt = DateTime.parse(json['updatedAt']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category.toJson(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString()
    };
  }
}

class UninitalizedProductModel extends ProductModel {}
