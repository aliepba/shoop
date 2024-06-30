import 'package:flutter/material.dart';
import 'package:shoop/models/transaction_model.dart';
import 'package:shoop/theme.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  TransactionCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: backgroundColor4),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/img_chat.png',
            width: 60,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TRX/010124/${transaction.id}',
                style: priceTextStyle.copyWith(
                    fontSize: 16, decoration: TextDecoration.none),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  transaction.status,
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/detail-transaction');
          },
          child: Icon(
            Icons.receipt_long,
            color: Colors.white,
          ),
        )
      ]),
    );
  }
}
