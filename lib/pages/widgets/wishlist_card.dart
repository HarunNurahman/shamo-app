import 'package:flutter/material.dart';
import 'package:shamo/themes.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({
    super.key,
    required this.imgUrl,
    required this.productName,
    required this.price,
  });

  final String imgUrl;
  final String productName;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 12,
        left: 12,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        color: bgColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(defaultRadius),
            child: Image.asset(
              imgUrl,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text('\$$price', style: priceTextStyle),
              ],
            ),
          ),
          Image.asset(
            'assets/icons/btn_wishlist-on.png',
            width: 34,
          )
        ],
      ),
    );
  }
}
