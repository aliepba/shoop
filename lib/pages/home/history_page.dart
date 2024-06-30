import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shoop/models/transaction_model.dart';
import 'package:shoop/providers/auth_provider.dart';
import 'package:shoop/providers/transaction_provider.dart';
import 'package:shoop/services/transaction_service.dart';
import 'package:shoop/theme.dart';
import 'package:shoop/widgets/transaction_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'History Transaction',
          style: thirdTextStyle,
        ),
        elevation: 0,
      );
    }

    Widget content() {
      return FutureBuilder(
        future: transactionProvider.getTransactions(authProvider.user.token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Consumer<TransactionProvider>(
              builder: (context, transactionProvider, child) {
                if (transactionProvider.transactions.isEmpty) {
                  return Center(child: Text('No transactions found.'));
                } else {
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    itemCount: transactionProvider.transactions.length,
                    itemBuilder: (context, index) {
                      final transaction =
                          transactionProvider.transactions[index];
                      return TransactionCard(transaction);
                    },
                  );
                }
              },
            );
          }
        },
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
