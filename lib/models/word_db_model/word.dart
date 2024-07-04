class Word {
  int id;
  String wordVn;
  String wordKh;
  String exampleVn;
  String exampleKh;
  int favoriteWord;
  int checkedWord;

  Word({
    required this.id,
    required this.wordVn,
    required this.wordKh,
    required this.exampleVn,
    required this.exampleKh,
    required this.favoriteWord,
    required this.checkedWord,
  });

  // Convert a Word object into a Map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word_vn': wordVn,
      'word_kh': wordKh,
      'example_vn': exampleVn,
      'example_kh': exampleKh,
      'favorite_word': favoriteWord,
      'checked_word': checkedWord,
    };
  }

  // Create a Word object from a Map.
  factory Word.fromMap(Map<String, dynamic> map) {
    return Word(
      id: map['id'],
      wordVn: map['word_vn'],
      wordKh: map['word_kh'],
      exampleVn: map['example_vn'],
      exampleKh: map['example_kh'],
      favoriteWord: map['favorite_word'],
      checkedWord: map['checked_word'],
    );
  }
}
