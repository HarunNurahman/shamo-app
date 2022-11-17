import 'package:get/get.dart';
import 'package:shamo/pages/login_page.dart';
import 'package:shamo/pages/register_page.dart';
import 'package:shamo/pages/splash_page.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: '/',
      page: () => SplashPage(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
    ),
    GetPage(
      name: '/register',
      page: () => RegisterPage(),
    )
  ];
}
