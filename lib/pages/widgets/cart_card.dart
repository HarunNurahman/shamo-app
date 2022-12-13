import 'package:flutter/material.dart';
import 'package:shamo/config/themes.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.imgUrl,
    required this.productName,
    required this.productPrice,
  });

  final String imgUrl;
  final String productName;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row (Product Image, Product Name / Price, Quantity)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(defaultRadius),
                child: Image.asset(
                  imgUrl,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              // Product Name and Price
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      productName,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    // Product Price
                    Text(
                      productPrice,
                      style: priceTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
              ),
              // Increase or Decrease Quantity
              Column(
                children: [
                  Image.asset('assets/icons/btn_add.png', width: 16), // ++
                  const SizedBox(height: 2),
                  Text(
                    '2',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Image.asset('assets/icons/btn_remove.png', width: 16), // --
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          // Remove Button
          Row(
            children: [
              Image.asset('assets/icons/btn_delete.png', width: 10),
              const SizedBox(width: 4),
              Text(
                'Remove',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                  color: alertColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
