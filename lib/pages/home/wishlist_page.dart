import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoop/providers/product_provider.dart';
import 'package:shoop/theme.dart';
import 'package:shoop/widgets/wishlist_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Favorite Shoes',
          style: primaryTextStyle,
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget content() {
      return Expanded(
          child: Container(
              color: backgroundColor0,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                children: productProvider.wishlist
                    .map((product) => WishlistCard(product))
                    .toList(),
              )));
    }

    Widget emptyWishlist() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroundColor0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img_favorite.png',
              width: 74,
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              'You don\'t have dream shoes?',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Let\s find your favorite shoes',
              style: secondaryTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text(
                      'Explore Store',
                      style: thirdTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    )))
          ],
        ),
      ));
    }

    return Column(
      children: [
        header(),
        productProvider.wishlist.length == 0 ? emptyWishlist() : content()
      ],
    );
  }
}
