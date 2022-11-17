import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/route.dart';

void main() => runApp(const MyApp());

// void main() => runApp(
//       DevicePreview(
//         builder: (context) => const MyApp(),
//         enabled: !kReleaseMode,
//       ),
//     );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      getPages: PageRoutes.pages,
      initialRoute: '/',
    );
  }
}
