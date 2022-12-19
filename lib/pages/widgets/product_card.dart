import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/config/themes.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/product_page.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductPage(product)),
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
            Image.network(
              product.galleries![0].url!,
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
                    product.category!.name!,
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Shoes Brand
                  Text(
                    product.name!.toUpperCase(),
                    maxLines: 1,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Price
                  Text(
                    '\$${product.price}',
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
