import 'package:get/get.dart';
import 'package:shamo/pages/edit-profile_page.dart';
import 'package:shamo/pages/home/dashboard_page.dart';
import 'package:shamo/pages/detail-chat_page.dart';
import 'package:shamo/pages/login_page.dart';
import 'package:shamo/pages/register_page.dart';
import 'package:shamo/pages/splash_page.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/register',
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: '/dashboard',
      page: () => const DashboardPage(),
    ),
    GetPage(
      name: '/message',
      page: () => const DetailChatPage(),
    ),
    GetPage(
      name: '/edit-profile',
      page: () => const EditProfilePage(),
    ),
  ];
}
