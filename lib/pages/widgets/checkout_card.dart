import 'package:flutter/material.dart';
import 'package:shamo/themes.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    super.key,
    required this.imgUrl,
    required this.productName,
    required this.productPrice,
    required this.quantity,
  });

  final String imgUrl;
  final String productName;
  final double productPrice;
  final int quantity;

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
            child: Image.asset(
              imgUrl,
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
                  productName,
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text('\$${productPrice.toString()}', style: priceTextStyle),
              ],
            ),
          ),
          SizedBox(width: defaultRadius),
          // Quantity
          Text(
            '$quantity Item(s)',
            style: secondaryTextStyle.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
