import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/widgets/cart_card.dart';
import 'package:shamo/config/themes.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/page_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    // Header (Page Title, Back Button)
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: bgColor1,
        toolbarHeight: 70,
        titleSpacing: 0,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Your Cart',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: primaryTextColor,
          ),
        ),
      );
    }

    // Cart Empty State
    Widget emptyCart() {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/ic_cart-404.png',
                width: 80,
              ),
              const SizedBox(height: 20),
              Text(
                'Oops! Your Cart is Empty',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 12),
              Text('Let\'s find your favorite shoes', style: subtitleTextStyle),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/dashboard');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    )),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Cart Content
    Widget contentCart() {
      return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: cartProvider.carts.map((cart) => CartCard(cart)).toList(),
          ),
        ),
      );
    }

    // Custom Bottom Navigation Bar
    Widget customBottomNav() {
      return Container(
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal', style: primaryTextStyle),
                  Text(
                    '\$${cartProvider.totalPrice()}',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: defaultMargin),
            Divider(
              color: subtitleTextColor,
              thickness: 1,
            ),
            SizedBox(height: defaultMargin),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/checkout');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Checkout',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: primaryTextColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: Column(
        children: [
          cartProvider.carts.isEmpty ? emptyCart() : contentCart(),
        ],
      ),
      bottomNavigationBar:
          cartProvider.carts.isEmpty ? const SizedBox() : customBottomNav(),
    );
  }
}
