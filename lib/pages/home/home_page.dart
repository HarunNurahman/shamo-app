import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/pages/widgets/category_widget.dart';
import 'package:shamo/pages/widgets/product_card.dart';
import 'package:shamo/pages/widgets/product_tile.dart';
import 'package:shamo/config/themes.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/product_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel userModel = authProvider.user;

    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    // Header Widget (Profile name and username and profile picture)
    Widget header() {
      return Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Hello, ${userModel.name!}', // Mengambil value 'name' dari UserModel yang terhubung dari authProvider
                  style: primaryTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semibold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                // Username
                Text(
                  '@${userModel.username!}', // Mengambil value 'username'
                  style: subtitleTextStyle.copyWith(fontSize: 16),
                )
              ],
            ),
          ),
          // Profile Picture
          CircleAvatar(
            radius: 32,
            backgroundImage:
                NetworkImage(userModel.profilePhotoUrl!.toString()),
          )
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
              /// Running
              CategoryWidget(
                category: 'Running',
                textStyle: subtitleTextStyle.copyWith(fontSize: 12),
                background: transparentColor,
                border: borderColor,
              ),
              // Training
              CategoryWidget(
                category: 'Training',
                textStyle: subtitleTextStyle.copyWith(fontSize: 12),
                background: transparentColor,
                border: borderColor,
              ),
              // Basketball
              CategoryWidget(
                category: 'Basketball',
                textStyle: subtitleTextStyle.copyWith(fontSize: 12),
                background: transparentColor,
                border: borderColor,
              ),
              // Hiking
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
            // Product List
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productProvider.products
                    .map((product) => ProductCard(product))
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }

    // New Arrival Products
    Widget newArrivals() {
      return Padding(
        padding: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Arrivals',
              style: primaryTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semibold,
              ),
            ),
            const SizedBox(height: 14),
            // Product List
            Column(
              children: productProvider.products
                  .map(
                    (product) => ProductTile(product),
                  )
                  .toList(),
            )
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
                newArrivals(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
