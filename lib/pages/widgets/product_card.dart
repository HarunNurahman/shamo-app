import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/themes.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.imgUrl,
    required this.category,
    required this.productName,
    required this.price,
  });

  final String imgUrl;
  final String category;
  final String productName;
  final String price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/product'),
      child: Container(
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
            // Product Image
            Image.asset(
              imgUrl,
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
                    category,
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Shoes Brand
                  Text(
                    productName.toUpperCase(),
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Price
                  Text(
                    price,
                    style: priceTextStyle.copyWith(fontWeight: semibold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
