import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoop/models/product_model.dart';
import 'package:shoop/pages/product_page.dart';
import 'package:shoop/theme.dart';

class ProductNew extends StatelessWidget {
  final ProductModel product;
  ProductNew(this.product);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(product)));
      },
      child: Container(
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/img_run_4.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
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
                  product.category.name,
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  product.name,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  maxLines: 1,
                ),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle.copyWith(fontWeight: medium),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
