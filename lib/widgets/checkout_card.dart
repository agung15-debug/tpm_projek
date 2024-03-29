import 'package:final_tpm/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:final_tpm/theme.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({super.key, required this.cart});
  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: backgroundColor4,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(cart.product!.galleries![0].url!),
                ),
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
                    cart.product!.name!,
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'IDR ${cart.product!.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              '${cart.quantity} Items',
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
              ),
            ),
          ],
        ));
  }
}
