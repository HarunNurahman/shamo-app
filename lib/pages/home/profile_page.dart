import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/themes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Header App
  Widget header() {
    return AppBar(
      backgroundColor: bgColor1,
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/icons/ic_profile_pic.png',
                  width: 64,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Harun',
                      style: primaryTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      '@Harunamanya',
                      style: subtitleTextStyle.copyWith(fontSize: 16),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Get.offAllNamed('/login'),
                child: Image.asset('assets/icons/ic_logout.png', width: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Profile Content
  Widget profileContent() {
    Widget menuItem(String text) {
      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: secondaryTextStyle),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              color: secondaryTextColor,
            )
          ],
        ),
      );
    }

    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        color: bgColor3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Account',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            GestureDetector(
              child: menuItem('Edit Profile'),
              onTap: () => Get.toNamed('/edit-profile'),
            ),
            menuItem('Your Orders'),
            menuItem('Help'),
            SizedBox(height: defaultMargin),
            Text(
              'General',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            menuItem('Privacy & Policy'),
            menuItem('Terms of Services'),
            menuItem('Rate Our App'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      body: Column(
        children: [
          header(),
          profileContent(),
        ],
      ),
    );
  }
}
