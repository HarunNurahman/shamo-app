import 'package:flutter/material.dart';
import 'package:shamo/themes.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/icons/ic_cart.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
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
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/ic_home.png',
                  width: 20,
                  color: currentIndex == 0
                      ? primaryColor
                      : const Color(0xFF808191),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/ic_chat.png',
                  width: 20,
                  color: currentIndex == 1
                      ? primaryColor
                      : const Color(0xFF808191),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/ic_wishlist.png',
                  width: 20,
                  color: currentIndex == 2
                      ? primaryColor
                      : const Color(0xFF808191),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/ic_profile.png',
                  width: 18,
                  color: currentIndex == 3
                      ? primaryColor
                      : const Color(0xFF808191),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: Center(
        child: Text(
          'Dashboard Page',
          style: primaryTextStyle,
        ),
      ),
    );
  }
}
