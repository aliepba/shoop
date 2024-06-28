import 'package:shoop/models/product_model.dart';

class MessageModel {
  String message;
  int userId;
  String userName;
  String userPhone;
  bool isFromUser;
  ProductModel product;
  DateTime createdAt;
  DateTime updatedAt;

  MessageModel(
      {required this.message,
      required this.userId,
      required this.userName,
      required this.userPhone,
      required this.isFromUser,
      required this.product,
      required this.createdAt,
      required this.updatedAt});

  MessageModel.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        userId = json['userId'],
        userName = json['userName'],
        userPhone = json['userPhone'],
        isFromUser = json['isFromUser'],
        product = json['product'].isEmpty
            ? UninitalizedProductModel()
            : ProductModel.fromJson(json['product']),
        createdAt = DateTime.parse(json['createdAt']),
        updatedAt = DateTime.parse(json['updatedAt']);

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userId': userId,
      'userName': userName,
      'userPhone': userPhone,
      'isFromUser': isFromUser,
      'product': product is UninitalizedProductModel ? {} : product.toJson(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString()
    };
  }
}
