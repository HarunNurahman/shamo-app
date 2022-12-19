import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/config/themes.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/providers/cart_provider.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;

  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

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
                child: Image.network(
                  cart.product!.galleries![0].url!,
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
                      cart.product!.name!,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    // Product Price
                    Text(
                      '\$${cart.product!.price}',
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
                  // Increase quantity button
                  GestureDetector(
                    onTap: () => cartProvider.addQuantity(cart.id!),
                    child: Image.asset('assets/icons/btn_add.png', width: 16),
                  ), // ++
                  const SizedBox(height: 2),
                  Text(
                    cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Decrease quantity button
                  GestureDetector(
                    onTap: () => cartProvider.reduceQuantity(cart.id!),
                    child:
                        Image.asset('assets/icons/btn_remove.png', width: 16),
                  ), // --
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          // Remove Button
          GestureDetector(
            onTap: () => cartProvider.removeCart(cart.id!),
            child: Row(
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
            ),
          )
        ],
      ),
    );
  }
}
