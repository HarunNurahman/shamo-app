import 'package:flutter/material.dart';
import 'package:shamo/config/themes.dart';
import 'package:shamo/models/cart_model.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cart;

  CheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(defaultRadius),
            child: Image.network(
              cart.product!.galleries![0].url!,
              width: 64,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: defaultRadius),
          // Product Item(s) and Price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                Text(
                  cart.product!.name!,
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text('\$${cart.product!.price}', style: priceTextStyle),
              ],
            ),
          ),
          SizedBox(width: defaultRadius),
          // Quantity
          Text(
            '${cart.quantity} Item(s)',
            style: secondaryTextStyle.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
