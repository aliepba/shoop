import 'package:flutter/material.dart';
import 'package:shoop/models/product_model.dart';
import 'package:shoop/pages/product_page.dart';
import 'package:shoop/theme.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(product)));
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xffECEDEF)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/img_basket_1.png',
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,
                    style: primaryTextStyle.copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    product.name,
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: semiBold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$${product.price}',
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
