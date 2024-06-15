import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shoop/models/product_model.dart';
import 'package:shoop/providers/product_provider.dart';
import 'package:shoop/theme.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;
  WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

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
                product.name,
                style: primaryTextStyle.copyWith(fontWeight: semiBold),
              ),
              Text(
                '\$${product.price}',
                style: priceTextStyle,
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            productProvider.setProduct(product);
          },
          child: Image.asset(
            'assets/img_wishlist_on.png',
            width: 34,
          ),
        )
      ]),
    );
  }
}
