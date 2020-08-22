import 'package:flutter/foundation.dart';
import 'package:word_me/models/heb_word.dart';

class TestManeger extends ChangeNotifier {
  int _testIndex = 0;

  List<HebWord> testWords;

  TestManeger(this.testWords);

  int get testIndex => _testIndex;
  set testIndex(int value) {
    if (maxIndex + 1 > value) {
      _testIndex = value;
      notifyListeners();
    }
  }

  int get maxIndex => testWords.length;
  HebWord get currentWord => testWords[testIndex];
  bool get isDone => testIndex == maxIndex;
}
