import 'package:get/get.dart';
import '../../models/word_db_model/word.dart';
import '../../services/database_helper/database_helper.dart';

class TranslateWordController extends GetxController {
  List<Word> wordsList = [];
  List<Word> filteredWordsList = [];

  // get all the words from local database
  Future<void> getAllWordsLocalDB() async {
    wordsList = [];
    List<Word> wordRes = await DatabaseHelper.getAllWords();
    wordsList.addAll(wordRes);
    update();
  }

  void filterWords(String query) {
    filteredWordsList = [];

    if (query.isEmpty) {
      filteredWordsList = wordsList;
    } else {
      filteredWordsList = wordsList
          .where(
              (word) => word.wordVn.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }
}
