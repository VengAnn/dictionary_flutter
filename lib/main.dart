import 'package:dictionary/pages/splash/splash_page.dart';
import 'package:dictionary/theme_modes/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/database_helper/database_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the database
  await DatabaseHelper.initializeDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeHelperController());

    return GetBuilder<ThemeHelperController>(builder: (themeHelperController) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dictionary App',
        theme: Get.find<ThemeHelperController>().themeData,
        home: const SplashPage(),
      );
    });
  }
}
