import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoop/theme.dart';
import 'package:shoop/widgets/transaction_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'History Transaction',
          style: thirdTextStyle,
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          TransactionCard(),
          TransactionCard(),
          TransactionCard(),
          TransactionCard(),
          TransactionCard(),
          TransactionCard(),
          TransactionCard(),
          TransactionCard(),
          TransactionCard(),
          TransactionCard(),
          TransactionCard()
        ],
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 120,
        child: Column(
          children: [
            Divider(
              thickness: 0.3,
              color: subtitleColor,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to checkout',
                      style: thirdTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    Icon(Icons.arrow_forward, color: primaryTextColor)
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor0,
      appBar: header(),
      body: content(),
    );
  }
}
