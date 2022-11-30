import 'package:get/get.dart';
import 'package:shamo/pages/cart_page.dart';
import 'package:shamo/pages/edit-profile_page.dart';
import 'package:shamo/pages/home/dashboard_page.dart';
import 'package:shamo/pages/detail-chat_page.dart';
import 'package:shamo/pages/login_page.dart';
import 'package:shamo/pages/product_page.dart';
import 'package:shamo/pages/register_page.dart';
import 'package:shamo/pages/splash_page.dart';

class PageRoutes {
  static final pages = [
    // Initial Route (Splash Screen)
    GetPage(name: '/', page: () => const SplashPage()),
    // Login Page Route
    GetPage(name: '/login', page: () => const LoginPage()),
    // Register Page Route
    GetPage(name: '/register', page: () => const RegisterPage()),
    // Dashboard Page Route
    GetPage(name: '/dashboard', page: () => const DashboardPage()),
    // Detail Chat Page Route
    GetPage(name: '/message', page: () => const DetailChatPage()),
    // Edit Profile Page Route
    GetPage(name: '/edit-profile', page: () => const EditProfilePage()),
    // Product Page Route
    GetPage(name: '/product', page: () => const ProductPage()),
    // Cart Page Route
    GetPage(name: '/cart', page: () => const CartPage()),
  ];
}
