import 'package:flutter/foundation.dart';
import 'package:word_me/const/test_conditions.dart';
import 'package:word_me/models/heb_word.dart';

class TestManeger extends ChangeNotifier {
  int _testIndex = 0;

  int get testIndex => _testIndex;
  set testIndex(int value) {
    if (maxIndex + 1 > value) {
      _testIndex = value;
      notifyListeners();
    }
  }

  List<HebWord> testWords;

  Map<HebWord, List<String>> testResults; // know / unknow / got_hint
  TestManeger(this.testWords) {
    this.testResults = {currentWord: []};
  }

  bool _showAnswer = false;
  bool get showAnswer => _showAnswer;
  set showAnswer(bool value) {
    _showAnswer = value;
    notifyListeners();
  }

  bool get showTranslation {
    if (testResults == null) {}
    return showAnswer ||
        testResults[currentWord]?.contains(test_unknow) ||
        false;
  }

  void testResultsAppend(String action, HebWord word) {
    if (!testResults.containsKey(word)) {
      testResults[word] = <String>[];
    }
    testResults[word].add(action);
  }

  int get maxIndex => testWords.length;
  HebWord get currentWord => testWords[testIndex];
  bool get isDone => testIndex == maxIndex;
}
