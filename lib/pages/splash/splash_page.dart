import 'package:dictionary/pages/main_page/main_page.dart';
import 'package:dictionary/widgets/text_reuseble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimentsions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const MainPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = Dimensions(context);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App logo
            Image.asset(
              width: dimensions.height20 * 10,
              "assets/images/dictionary.png",
            ),
            SizedBox(height: dimensions.height20),
            // Splash text
            TextReusable(
              text: "The Best Dictionary",
              fontSize: dimensions.fontSize15,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
