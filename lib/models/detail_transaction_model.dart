class DetailTransactionModel {
  int id;
  String userId;
  String productId;
  String orderId;
  String name;
  int quantity;
  String price;
  String totalPrice;

  DetailTransactionModel(
      {required this.id,
      required this.userId,
      required this.productId,
      required this.orderId,
      required this.name,
      required this.quantity,
      required this.price,
      required this.totalPrice});

  DetailTransactionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        productId = json['productId'],
        orderId = json['orderId'],
        name = json['name'],
        price = json['price'],
        quantity = json['quantity'],
        totalPrice = json['totalPrice'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'productId': productId,
      'orderId': orderId,
      'name': name,
      'price': price,
      'quantity': quantity,
      'totalPrice': totalPrice
    };
  }
}
