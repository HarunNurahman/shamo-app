import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo/config/themes.dart';
import 'package:shamo/providers/product_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // String? getToken;

  @override
  void initState() {
    // Session
    // getValidationData().whenComplete(() async {
    //   await Provider.of<ProductProvider>(context, listen: false).getProducts();
    //   Get.offAllNamed(getToken == null ? '/login' : '/dashboard');
    // });
    getInit();
    super.initState();
  }

  getInit() async {
    // Mengambil data produk
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    Get.offAllNamed('/login');
  }

  // Future getValidationData() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   var token = sharedPreferences.getString('token');
  //   setState(() {
  //     getToken = token;
  //   });
  //   print(token);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: Center(
        child: Image.asset(
          'assets/app_logo.png',
          width: 130,
        ),
      ),
    );
  }
}
