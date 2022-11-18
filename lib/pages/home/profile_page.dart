import 'package:flutter/material.dart';
import 'package:shamo/themes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'ProfilePage',
          style: primaryTextStyle,
        ),
      ),
    );
  }
}
