import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shoop/models/user_model.dart';
import 'package:shoop/providers/auth_provider.dart';
import 'package:shoop/providers/product_provider.dart';
import 'package:shoop/theme.dart';
import 'package:shoop/widgets/product_card.dart';
import 'package:shoop/widgets/product_new.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, ${user.name}',
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    '${user.email}',
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/img_profile.png'))),
            )
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryColor),
                child: Text(
                  'All Shoes',
                  style:
                      thirdTextStyle.copyWith(fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: subtitleColor),
                    color: transparentColor),
                child: Text(
                  'Running',
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: subtitleColor),
                    color: transparentColor),
                child: Text(
                  'Training',
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: subtitleColor),
                    color: transparentColor),
                child: Text(
                  'Basketball',
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget popularProductsTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          'Popular products',
          style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: productProvider.products
                    .map((product) => ProductCard(product))
                    .toList(),
              )
            ],
          ),
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          'New Arrivals',
          style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
          children: productProvider.products
              .map((product) => ProductNew(product))
              .toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularProductsTitle(),
        popularProducts(),
        newArrivalsTitle(),
        newArrivals()
      ],
    );
  }
}
