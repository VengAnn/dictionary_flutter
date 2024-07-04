import 'dart:developer';

import 'package:dictionary/theme_modes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dark_mode.dart';

class ThemeHelperController extends GetxController {
  // initialize light mode
  ThemeData _themeData = ligthMode;

  // getter the the theme data
  ThemeData get themeData => _themeData;

  // getter is the dark mode
  bool get isDarkMode => _themeData == mydarkMode;

  // set the theme data
  void setThemeData(ThemeData value) {
    _themeData = value;

    update(); // update the ui
  }

  // change the theme mode toggle
  void toggleChangeThemeMode() {
    log("toggling change theme mode");
    // when it light mode true set it to dark mode and otherwise set it to light mode
    _themeData == ligthMode
        ? setThemeData(mydarkMode)
        : setThemeData(ligthMode);
  }
}
