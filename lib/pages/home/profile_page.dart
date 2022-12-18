import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo/config/themes.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel userModel = authProvider.user;

    // Header App (Profile Picture, Name, Username, Logout Button)
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
                // Profile Picture
                ClipOval(
                  child: Image.network(
                    userModel.profilePhotoUrl.toString(),
                    width: 64,
                  ),
                ),
                const SizedBox(width: 16),
                // Name and Username
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, ${userModel.name}',
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semibold,
                        ),
                      ),
                      Text(
                        '@${userModel.username}',
                        style: subtitleTextStyle.copyWith(fontSize: 16),
                      )
                    ],
                  ),
                ),
                // Logout Button
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () async {
                      final SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.remove('token');
                      Get.offAllNamed('/login');
                    },
                    child: Image.asset('assets/icons/ic_logout.png', width: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Profile Content
    Widget profileContent() {
      // Menu Item Button
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
              // Title
              Text(
                'Account',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
              // Menu Item Button
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
