import 'package:flutter/material.dart';
import 'package:shamo/pages/widgets/category_widget.dart';
import 'package:shamo/pages/widgets/product_card.dart';
import 'package:shamo/themes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Header Widget (Profile name and username and profile picture)
    Widget header() {
      return Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Harun',
                  style: primaryTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semibold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '@Harunamanya',
                  style: subtitleTextStyle.copyWith(fontSize: 16),
                )
              ],
            ),
          ),
          Image.asset('assets/images/img_profile.png', width: 56),
        ],
      );
    }

    // Category Widget
    Widget categories() {
      return Padding(
        padding: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // Active Category
              CategoryWidget(
                category: 'All Shoes',
                background: primaryColor,
                textStyle: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
                border: transparentColor,
              ),
              // Inactive Category
              CategoryWidget(
                category: 'Running',
                textStyle: subtitleTextStyle.copyWith(fontSize: 12),
                background: transparentColor,
                border: borderColor,
              ),
              CategoryWidget(
                category: 'Training',
                textStyle: subtitleTextStyle.copyWith(fontSize: 12),
                background: transparentColor,
                border: borderColor,
              ),
              CategoryWidget(
                category: 'Basketball',
                textStyle: subtitleTextStyle.copyWith(fontSize: 12),
                background: transparentColor,
                border: borderColor,
              ),
              CategoryWidget(
                category: 'Hiking',
                textStyle: subtitleTextStyle.copyWith(fontSize: 12),
                background: transparentColor,
                border: borderColor,
              ),
            ],
          ),
        ),
      );
    }

    // Popular Products Widget
    Widget popularProducts() {
      return Padding(
        padding: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Popular Products',
              style: primaryTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semibold,
              ),
            ),
            const SizedBox(height: 14),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                categories(),
                popularProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
