import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/config/route.dart';
import 'package:shamo/providers/product_provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider())
      ],
      child: GetMaterialApp(
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        getPages: PageRoutes.pages,
        initialRoute: '/',
      ),
    );
  }
}
