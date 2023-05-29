import 'package:final_tpm/models/user_model.dart';
import 'package:final_tpm/providers/auth_provider.dart';
import 'package:final_tpm/providers/product_provider.dart';
import 'package:final_tpm/widgets/product_card.dart';
import 'package:final_tpm/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:final_tpm/theme.dart';
import 'package:provider/provider.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hallo, ${user.name}',
                      style: primaryTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold)),
                  Text('@${user.username}',
                      style: subtitleTextStyle.copyWith(fontSize: 16)),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(user.profilePhotoUrl!),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            Container(
              margin: EdgeInsets.only(left: defaultMargin, right: 16),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'All Clothes',
                style: primaryTextStyle.copyWith(
                    fontSize: 13, fontWeight: medium, color: backgroundColor1),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: transparentColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: subtitleColor),
              ),
              child: Text(
                'Shirt',
                style: subtitleTextStyle.copyWith(
                    fontSize: 13, fontWeight: medium),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: transparentColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: subtitleColor),
              ),
              child: Text(
                'Jeans',
                style: subtitleTextStyle.copyWith(
                    fontSize: 13, fontWeight: medium),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: transparentColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: subtitleColor),
              ),
              child: Text(
                'Blazer',
                style: subtitleTextStyle.copyWith(
                    fontSize: 13, fontWeight: medium),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: transparentColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: subtitleColor),
              ),
              child: Text(
                'Jacket',
                style: subtitleTextStyle.copyWith(
                    fontSize: 13, fontWeight: medium),
              ),
            ),
          ]),
        ),
      );
    }

    Widget popularProductTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          'Popular Product',
          style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
        ),
      );
    }

    Widget popularProduct() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.products
                .map((product) => ProductCard(product: product))
                .toList(),
          ),
        ),
      );
    }

    Widget newaArrivalsTitle() {
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
                .map((product) => ProductTile(product: product))
                .toList(),
          ));
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularProductTitle(),
        popularProduct(),
        newaArrivalsTitle(),
        newArrivals(),
      ],
    );
  }
}
