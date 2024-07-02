import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shoop/models/detail_transaction_model.dart';
import 'package:shoop/models/transaction_model.dart';
import 'package:shoop/providers/auth_provider.dart';
import 'package:shoop/theme.dart';

class DetailTransaction extends StatefulWidget {
  final TransactionModel transaction;
  DetailTransaction(this.transaction);

  @override
  State<DetailTransaction> createState() => _DetailTransactionState();

  static empty() {}
}

class _DetailTransactionState extends State<DetailTransaction> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor4,
        centerTitle: true,
        title: Text(
          'Detail Invoice',
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

    Widget detailProduct(DetailTransactionModel detail) {
      return Container(
        margin: EdgeInsets.only(left: 12, right: 12, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(detail.name),
            Text('${detail.quantity} * ${detail.price}')
          ],
        ),
      );
    }

    Widget content() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transaction',
                  style:
                      primaryTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                ),
                Text(
                  'TRX/010424/${widget.transaction.id}',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                )
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
            color: subtitleColor,
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Transaction Name'),
                Text(authProvider.user.name)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Payment Type'),
                Text('${widget.transaction.payment}')
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Address'),
                Text('${widget.transaction.address}')
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Detail Product',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: widget.transaction.detailTransaction
                  .map((detail) => detailProduct(detail))
                  .toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Price'),
                Text('\$${widget.transaction.totalPrice}')
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping Price'),
                Text('\$${widget.transaction.shippingPrice}')
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Payment'),
                Text('\$${widget.transaction.grandTotal}')
              ],
            ),
          )
        ],
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 80,
        child: Column(
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Go Find Shoes',
                      style: thirdTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
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
        bottomNavigationBar: customBottomNav());
  }
}
