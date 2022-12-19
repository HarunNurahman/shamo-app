import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/config/themes.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/product_page.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;

  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductPage(product)),
      child: Padding(
        padding: EdgeInsets.only(bottom: defaultMargin),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                product.galleries![0].url!,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: defaultRadius),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category!.name!,
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: defaultRadius - 6), // 12 - 6
                  Text(
                    product.name!,
                    maxLines: 2,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: defaultRadius - 6), // 12 - 6
                  Text(
                    '\$${product.price}',
                    style: priceTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
