import 'package:flutter/material.dart';
import 'package:shamo/pages/widgets/wishlist_card.dart';
import 'package:shamo/themes.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
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
            children: const [
              WishlistCard(
                imgUrl: 'assets/images/img_shoes-6.png',
                productName: 'Terrex Urban Low',
                price: '143.98',
              ),
              WishlistCard(
                imgUrl: 'assets/images/img_shoes-7.png',
                productName: 'Predator 20.3 Firm Ground Boots',
                price: '68.47',
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      body: Column(
        children: [
          header(),
          // emptyWishlist(),
          wishlistContent(),
        ],
      ),
    );
  }
}
