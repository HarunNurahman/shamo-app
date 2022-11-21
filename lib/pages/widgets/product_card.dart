import 'package:flutter/material.dart';
import 'package:shamo/themes.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: defaultMargin),
      width: 215,
      height: 280,
      decoration: BoxDecoration(
        color: const Color(0xFFECEDEF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: defaultMargin),
          Image.asset(
            'assets/images/img_shoes-1.png',
            width: 215,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Shoes Category
                Text(
                  'Hiking',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 6),
                // Shoes Brand
                Text(
                  'Court Vision 2.0'.toUpperCase(),
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semibold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 6),
                // Price
                Text(
                  '\$58.67',
                  style: priceTextStyle.copyWith(fontWeight: medium),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
