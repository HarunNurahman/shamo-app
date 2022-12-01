import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/pages/widgets/checkout_card.dart';
import 'package:shamo/themes.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.all(defaultMargin),
        children: [
          // List Items
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'List Item(s)',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const CheckoutCard(
                imgUrl: 'assets/images/img_shoes-7.png',
                productName: 'Terrex Urban Low',
                productPrice: 143.98,
                quantity: 2,
              ),
              const CheckoutCard(
                imgUrl: 'assets/images/img_shoes-4.png',
                productName: 'Court Vision 2.0 Shoes Limited Edition',
                productPrice: 57.15,
                quantity: 1,
              ),
            ],
          ),

          // Shipment Address
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
                // Row(
                //   children: [
                //     Column(
                //       children: [
                //         Image.asset(
                //           'assets/icons/ic_shipping-origin.png',
                //           width: 40,
                //         ),
                //         Image.asset(
                //           'assets/icons/ic_line.png',
                //           height: 30,
                //         ),
                //         Image.asset(
                //           'assets/icons/ic_shipping-destination.png',
                //           width: 40,
                //         ),
                //       ],
                //     ),
                //     SizedBox(width: defaultRadius),
                //     // Shipping Information
                //     Expanded(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             'Store Location',
                //             style: secondaryTextStyle.copyWith(
                //               fontSize: 12,
                //               fontWeight: light,
                //             ),
                //           ),
                //           Text(
                //             'Adidas Core',
                //             style: primaryTextStyle.copyWith(
                //               fontWeight: medium,
                //             ),
                //           ),
                //           SizedBox(height: defaultMargin),
                //           Text(
                //             'Your Address',
                //             style: secondaryTextStyle.copyWith(
                //               fontSize: 12,
                //               fontWeight: light,
                //             ),
                //           ),
                //           Text(
                //             'Home',
                //             style:
                //                 primaryTextStyle.copyWith(fontWeight: medium),
                //             maxLines: 2,
                //             overflow: TextOverflow.ellipsis,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
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
