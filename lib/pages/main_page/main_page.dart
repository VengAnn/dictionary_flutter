import '../translate_word/main_translate_word.dart';
import 'package:dictionary/theme_modes/light_mode.dart';
import 'package:dictionary/theme_modes/theme_helper.dart';
import 'package:dictionary/utils/dimentsions.dart';
import 'package:dictionary/widgets/text_reuseble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dimensions = Dimensions(context);
    return GetBuilder<ThemeHelperController>(builder: (themeHelperController) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Awesome Dictionary",
            style: TextStyle(
              fontSize: dimensions.fontSize20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            // this for light mode and dark mode
            IconButton(
              icon: Icon(
                themeHelperController.isDarkMode
                    ? Icons.dark_mode_outlined
                    : Icons.brightness_6_outlined,
                color: themeHelperController.isDarkMode
                    ? Colors.white
                    : ligthMode.colorScheme.inversePrimary,
              ),
              onPressed: () {
                Get.find<ThemeHelperController>().toggleChangeThemeMode();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: dimensions.height10),
            SizedBox(
              height: dimensions.height20 * 20,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return ContainerReusable(
                      ontap: () {
                        Get.to(() => const MainTranslateWord());
                      },
                      width: double.maxFinite,
                      height: dimensions.height20 * 3,
                      dimensions: dimensions,
                      color: Colors.amber,
                      child: Row(
                        children: [
                          TextReusable(
                            text: "Translate Word",
                            fontSize: dimensions.fontSize15,
                          ),
                        ],
                      ),
                    );
                  } else if (index == 1) {
                    return ContainerReusable(
                      ontap: () {},
                      width: double.maxFinite,
                      height: dimensions.height20 * 3,
                      dimensions: dimensions,
                      child: Row(
                        children: [
                          TextReusable(
                            text: "Translate online",
                            fontSize: dimensions.fontSize15,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    );
                  } else if (index == 2) {
                    return ContainerReusable(
                      ontap: () {
                        // exit app
                        SystemNavigator.pop();
                      },
                      width: double.maxFinite,
                      height: dimensions.height20 * 3,
                      dimensions: dimensions,
                      color: Colors.red,
                      child: Row(
                        children: [
                          TextReusable(
                            text: "Exit",
                            fontSize: dimensions.fontSize15,
                          ),
                        ],
                      ),
                    );
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

class ContainerReusable extends StatelessWidget {
  final Dimensions dimensions;
  final Color color;
  final double width;
  final double height;
  final Widget child;
  final VoidCallback ontap;

  const ContainerReusable({
    super.key,
    required this.dimensions,
    this.color = Colors.white,
    required this.width,
    required this.height,
    required this.child,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: dimensions.height10,
          left: dimensions.width10,
          right: dimensions.width10,
        ),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(dimensions.width10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
