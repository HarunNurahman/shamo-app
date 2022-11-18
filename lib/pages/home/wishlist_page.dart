import 'package:flutter/material.dart';
import 'package:shamo/themes.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'WishlistPage',
          style: primaryTextStyle,
        ),
      ),
    );
  }
}