import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoop/theme.dart';

class DetailTransaction extends StatelessWidget {
  const DetailTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
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

    Widget detailProduct() {
      return Container(
        margin: EdgeInsets.only(left: 12, right: 12, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('NB550'), Text('4 * \$25')],
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
                  'TRX/010424/001',
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
              children: [Text('Transaction Name'), Text('Adudu')],
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
              children: [detailProduct(), detailProduct(), detailProduct()],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Total Price'), Text('\$100')],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Shipping Price'), Text('\$90')],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Total Payment'), Text('\$190')],
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Shopping',
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
        bottomNavigationBar: customBottomNav());
  }
}
