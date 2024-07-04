import 'package:dictionary/theme_modes/dark_mode.dart';
import 'package:dictionary/theme_modes/theme_helper.dart';
import 'package:dictionary/widgets/text_reuseble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/translate_word_controller/traslate_word_controller.dart';
import '../../utils/dimentsions.dart';

class TranslateWordPage extends StatefulWidget {
  const TranslateWordPage({super.key});

  @override
  State<TranslateWordPage> createState() => _TranslateWordPageState();
}

class _TranslateWordPageState extends State<TranslateWordPage> {
  final TextEditingController searchWordsTextEditController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    Get.put(TranslateWordController());
    Get.find<TranslateWordController>().getAllWordsLocalDB();

    searchWordsTextEditController.addListener(_onSearchWordChanged);
  }

  @override
  void dispose() {
    searchWordsTextEditController.removeListener(_onSearchWordChanged);
    searchWordsTextEditController.dispose();

    super.dispose();
  }

  void _onSearchWordChanged() {
    Get.find<TranslateWordController>()
        .filterWords(searchWordsTextEditController.text);
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = Dimensions(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: GetBuilder<TranslateWordController>(
            builder: (traslateWordController) {
          return GetBuilder<ThemeHelperController>(
              builder: (themeHelperController) {
            return SafeArea(
              child: Column(
                children: [
                  // this like the appbar for searching the word
                  Row(
                    children: [
                      Container(
                        width: dimensions.screenWidth,
                        height: dimensions.height20 * 3,
                        decoration: BoxDecoration(
                          color: themeHelperController.isDarkMode
                              // ignore: deprecated_member_use
                              ? mydarkMode.colorScheme.background
                              : Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(dimensions.width5),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: themeHelperController.isDarkMode
                                  ? mydarkMode.colorScheme.primary
                                  : Colors.amber,
                              borderRadius:
                                  BorderRadius.circular(dimensions.width5),
                            ),
                            child: TextField(
                              controller: searchWordsTextEditController,
                              autofocus: true,
                              cursorColor: Colors.black,
                              // set the cursor position center
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search_outlined),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    // show dialog select the language
                                    showDialog(
                                      context: context,
                                      builder: (_) {
                                        return Dialog(
                                          child: Container(
                                            width: dimensions.width20 * 10,
                                            height: dimensions.height20 * 10,
                                            color: Colors.white,
                                            child:
                                                const Text("Select language"),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: dimensions.width5,
                                        vertical: dimensions.width5),
                                    width: dimensions.width20 * 4,
                                    height: double.infinity,
                                    color: Colors.blue,
                                    child: Center(
                                      child: TextReusable(
                                        text: "Vn -> Kh",
                                        fontSize: dimensions.fontSize15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // this what we need to show the list Tile of all the word from database
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      color: themeHelperController.isDarkMode
                          // ignore: deprecated_member_use
                          ? mydarkMode.colorScheme.background
                          : Colors.white,
                      child: ListView.builder(
                        itemCount:
                            traslateWordController.filteredWordsList.length,
                        itemBuilder: (context, index) {
                          final word =
                              traslateWordController.filteredWordsList[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.maxFinite,
                                height: dimensions.height20,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: dimensions.width20),
                                  child: TextReusable(
                                    text: word.wordVn,
                                    fontSize: dimensions.fontSize15,
                                    color: themeHelperController.isDarkMode
                                        ? Colors.amber
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              //
                              const Divider(),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        }),
      ),
    );
  }
}
