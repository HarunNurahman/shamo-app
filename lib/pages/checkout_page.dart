import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/widgets/checkout_card.dart';
import 'package:shamo/config/themes.dart';
import 'package:shamo/pages/widgets/loading-button_widget.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/transaction_provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {
      setState(() {
        isLoading = true;
      });

      if (await transactionProvider.checkout(
        authProvider.user.token!,
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        cartProvider.carts = [];
        Get.offAllNamed('/checkout-success');
      }

      setState(() {
        isLoading = false;
      });
    }

    // Header App Bar (Title, Back Button)
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: bgColor1,
        elevation: 0,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'Checkout',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: primaryTextColor,
          ),
        ),
      );
    }

    Widget checkoutContent() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          // List Items
          Padding(
            padding: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Item(s)',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                Column(
                  children: cartProvider.carts
                      .map(
                        (cart) => CheckoutCard(cart),
                      )
                      .toList(),
                )
              ],
            ),
          ),

          // Shipment Information
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bgColor4,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Detail',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: defaultRadius),
                // Shipping Origin
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/icons/ic_shipping-origin.png',
                          width: 40,
                        ),
                        Image.asset(
                          'assets/icons/ic_line.png',
                          height: 30,
                        ),
                        Image.asset(
                          'assets/icons/ic_shipping-destination.png',
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(width: defaultRadius),
                    // Shipping Information
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Store Location',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: light,
                            ),
                          ),
                          Text(
                            'Adidas Core',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                          SizedBox(height: defaultMargin),
                          Text(
                            'Your Address',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: light,
                            ),
                          ),
                          Text(
                            'Home',
                            style:
                                primaryTextStyle.copyWith(fontWeight: medium),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Payment Summary
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bgColor4,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: defaultRadius),
                // Product Quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${cartProvider.totalItem()} Item(s)',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
                SizedBox(height: defaultRadius),

                // Product Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Price',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '\$${cartProvider.totalPrice()}',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
                SizedBox(height: defaultRadius),

                // Shipping Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping Price',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Free',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
                SizedBox(height: defaultRadius),

                // Divider
                Divider(thickness: 1, color: priceColor),
                SizedBox(height: defaultRadius),

                // Total Shopping
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      '\$${cartProvider.totalPrice()}',
                      style: priceTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semibold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: defaultMargin),

          // Divider
          Divider(thickness: 1, color: subtitleTextColor),

          // Checkout Button
          isLoading
              ? Container(
                  margin: EdgeInsets.only(bottom: defaultMargin),
                  child: const LoadingButton(),
                )
              : Container(
                  margin: EdgeInsets.symmetric(vertical: defaultMargin),
                  child: ElevatedButton(
                    onPressed: handleCheckout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultRadius),
                      ),
                    ),
                    child: Text(
                      'Checkout Now',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                )
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: checkoutContent(),
    );
  }
}
