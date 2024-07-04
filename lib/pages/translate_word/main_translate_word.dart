import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:dictionary/theme_modes/dark_mode.dart';
import 'package:dictionary/theme_modes/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'translate__word.dart';

class MainTranslateWord extends StatefulWidget {
  const MainTranslateWord({super.key});

  @override
  State<MainTranslateWord> createState() => _MainTranslateWordState();
}

class _MainTranslateWordState extends State<MainTranslateWord> {
  int selectedIndex = 0;

  List<Widget> listOfPage = [
    const TranslateWordPage(),
    Container(
      width: double.maxFinite,
      color: Colors.blueAccent,
    ),
    Container(
      width: double.maxFinite,
      color: Colors.greenAccent,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfPage[selectedIndex],
      bottomNavigationBar:
          GetBuilder<ThemeHelperController>(builder: (themeHelperController) {
        return CurvedNavigationBar(
          color: themeHelperController.isDarkMode
              // ignore: deprecated_member_use
              ? mydarkMode.colorScheme.background
              : Colors.white,
          backgroundColor: themeHelperController.isDarkMode
              ? mydarkMode.colorScheme.inverseSurface
              : Colors.cyanAccent,
          items: [
            CurvedNavigationBarItem(
              child: Icon(
                Icons.home_outlined,
                color: themeHelperController.isDarkMode
                    ? const Color.fromRGBO(255, 255, 255, 1)
                    : Colors.black,
              ),
              label: 'Home',
            ),
            CurvedNavigationBarItem(
              child: Icon(
                Icons.favorite_border_outlined,
                color: themeHelperController.isDarkMode
                    ? Colors.white
                    : Colors.black,
              ),
              label: 'Favorite',
            ),
            CurvedNavigationBarItem(
              child: Icon(
                Icons.history_outlined,
                color: themeHelperController.isDarkMode
                    ? Colors.white
                    : Colors.black,
              ),
              label: 'History ',
            ),
          ],
          onTap: (index) {
            // Handle button tap
            setState(() {
              selectedIndex = index;
            });
          },
        );
      }),
    );
  }
}
