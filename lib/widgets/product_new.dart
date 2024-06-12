import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoop/theme.dart';

class ProductNew extends StatelessWidget {
  const ProductNew({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
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
                  'Running',
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Adidas Running 2.0',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                Text(
                  '\$68,47',
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
