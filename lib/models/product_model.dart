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

  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.category,
      required this.tags,
      required this.description,
      required this.createdAt,
      required this.updatedAt});

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
