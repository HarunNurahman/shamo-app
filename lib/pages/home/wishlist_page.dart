import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/widgets/wishlist_card.dart';
import 'package:shamo/config/themes.dart';
import 'package:shamo/providers/wishlist_provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    // Header Widget / App Bar
    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Favorite Shoes',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    // Body Widget (Empty Wishlist Status)
    Widget emptyWishlist() {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/ic_favorite.png',
                width: 74,
                height: 62,
              ),
              const SizedBox(height: 24),
              Text(
                'You don\'t have dream shoes?',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Let\'s find your favorite shoes!',
                style: secondaryTextStyle,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/dashboard');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                ),
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

    // Wishlist Content
    Widget wishlistContent() {
      return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          color: bgColor3,
          child: ListView(
              // Product List
              children: wishlistProvider.wishlist
                  .map((product) => WishlistCard(product))
                  .toList()),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      body: Column(
        children: [
          header(),
          wishlistProvider.wishlist.isEmpty
              ? emptyWishlist()
              : wishlistContent(),
        ],
      ),
    );
  }
}
