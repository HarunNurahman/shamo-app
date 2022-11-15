import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/themes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => Get.toNamed('/login'),
    );
    super.initState();
  }

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
