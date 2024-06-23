import 'package:flutter/material.dart';
import 'package:shoop/theme.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

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
                'No Transactions :',
                style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 18,
                    decoration: TextDecoration.none),
              ),
              Text(
                'TRX/010124/001',
                style: priceTextStyle.copyWith(
                    fontSize: 12, decoration: TextDecoration.none),
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
