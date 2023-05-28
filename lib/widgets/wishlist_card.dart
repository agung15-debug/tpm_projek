import 'package:flutter/material.dart';
import 'package:final_tpm/theme.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Image.asset(
                'assets/image_shoes.png',
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
                  'Football',
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ),
                Text(
                  'Adidas',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'IDR 1.200.000',
                  style:
                      priceTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/button_wishlist_enable.png',
            width: 34,
          ),
        ],
      ),
    );
  }
}
