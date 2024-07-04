import 'package:dictionary/pages/translate_word/main_translate_word.dart';
import 'package:get/get.dart';

import '../pages/main_page/main_page.dart';
import '../pages/splash/splash_page.dart';
import '../pages/translate_word/translate__word.dart';

class RouteHelper {
  static const String _splashPage = "/splash-page";

  //
  static const String _mainPage = "/main-page";
  static const String _mainTranslatePage = "/main-translate-page";
  static const String _translateWordPage = "/translate-word-page";

  // get all the routes
  static String getSplashPage() => _splashPage;

  static String getMainPage() => _mainPage;
  static String getMainTranslatePage() => _mainTranslatePage;
  static String getTranslateWordPage() => _translateWordPage;

  static List<GetPage> routes = [
    // splash-page
    GetPage(
      name: _splashPage,
      page: () => const SplashPage(),
      transition: Transition.fade,
    ),
    // main-page
    GetPage(
      name: _mainPage,
      page: () => const MainPage(),
      transition: Transition.fade,
    ),
    // main-translate-page
    GetPage(
      name: _mainTranslatePage,
      page: () => const MainTranslateWord(),
      transition: Transition.fade,
    ),
    // translate-word-page
    GetPage(
      name: _translateWordPage,
      page: () => const TranslateWordPage(),
      transition: Transition.fade,
    ),
  ];
}
