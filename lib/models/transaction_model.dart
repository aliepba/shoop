import 'package:shoop/models/detail_transaction_model.dart';
import 'package:shoop/pages/detail_transaction.dart';

class TransactionModel {
  int id;
  String address;
  String totalPrice;
  String shippingPrice;
  String grandTotal;
  String status;
  String payment;
  DateTime? createdAt;
  List<DetailTransactionModel> detailTransaction;

  TransactionModel(
      {this.id = 0,
      this.address = '',
      this.totalPrice = '',
      this.shippingPrice = '',
      this.grandTotal = '',
      this.status = '',
      this.payment = '',
      DetailTransactionModel? detailTransaction,
      this.createdAt})
      : detailTransaction = detailTransaction ?? DetailTransaction.empty();

  TransactionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        address = json['address'],
        totalPrice = json['totalPrice'],
        shippingPrice = json['shippingPrice'],
        grandTotal = json['grandTotal'],
        status = json['status'],
        payment = json['payment'],
        detailTransaction = (json['details'] as List<dynamic>)
            .map((item) => DetailTransactionModel.fromJson(item))
            .toList(),
        createdAt = DateTime.parse(json['createdAt']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'totalPrice': totalPrice,
      'shippingPrice': shippingPrice,
      'grandTotal': grandTotal,
      'status': status,
      'payment': payment,
      'details': detailTransaction.map((item) => item.toJson()).toList(),
      'createdAt': createdAt.toString()
    };
  }

  static empty() {
    return TransactionModel();
  }
}
