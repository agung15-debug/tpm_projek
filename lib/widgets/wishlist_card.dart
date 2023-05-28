import 'package:final_tpm/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:final_tpm/theme.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;
  const WishlistCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(
        top: 10,
        left: 12,
        right: 20,
        bottom: 14,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                product.galleries![0].url!,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category!.name!,
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ),
                Text(
                  product.name!,
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'IDR ${product.price}',
                  style:
                      priceTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
            },
            child: Image.asset(
              'assets/button_wishlist_enable.png',
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
