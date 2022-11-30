import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/pages/home/chat_page.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'package:shamo/pages/home/profile_page.dart';
import 'package:shamo/pages/home/wishlist_page.dart';
import 'package:shamo/themes.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0; // Page Index

  @override
  Widget build(BuildContext context) {
    // Middle Float Button for Cart Widget
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Get.toNamed('/cart');
        },
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/icons/ic_cart.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        // Styling Edge of Bottom Navigation Bar
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: Theme(
          // Disabling Ripple Effect
          data: Theme.of(context).copyWith(
            splashColor: transparentColor,
            hoverColor: transparentColor,
            highlightColor: transparentColor,
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 12,
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              backgroundColor: bgColor4,
              type: BottomNavigationBarType.fixed,
              items: [
                // Home Button
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/icons/ic_home.png',
                      width: 20,
                      color: currentIndex == 0
                          ? primaryColor
                          : const Color(0xFF808191),
                    ),
                  ),
                  label: '',
                ),
                // Message Button
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 60,
                    ),
                    child: Image.asset(
                      'assets/icons/ic_chat.png',
                      width: 20,
                      color: currentIndex == 1
                          ? primaryColor
                          : const Color(0xFF808191),
                    ),
                  ),
                  label: '',
                ),
                // Wishlist Button
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 60,
                    ),
                    child: Image.asset(
                      'assets/icons/ic_wishlist.png',
                      width: 20,
                      color: currentIndex == 2
                          ? primaryColor
                          : const Color(0xFF808191),
                    ),
                  ),
                  label: '',
                ),
                // Profile Button
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Image.asset(
                      'assets/icons/ic_profile.png',
                      width: 18,
                      color: currentIndex == 3
                          ? primaryColor
                          : const Color(0xFF808191),
                    ),
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      );
    }

    // State for Bottom Navigation Bar
    Widget body() {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ChatPage();
        case 2:
          return const WishlistPage();
        case 3:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
      backgroundColor: currentIndex == 0 ? bgColor1 : bgColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
