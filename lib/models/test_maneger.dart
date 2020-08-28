import 'package:flutter/foundation.dart';
import 'package:word_me/const/test_conditions.dart';
import 'package:word_me/models/file_maneger.dart';
import 'package:word_me/models/heb_word.dart';

class TestManeger extends ChangeNotifier {
  FileManager fileManager = FileManager();
  int _testIndex = 0;
  List<HebWord> testWords;
  Map<HebWord, List<String>> testResults; // know / unknow / got_hint

  TestManeger() {
    onCreated();
  }

  void onCreated() async {
    Map<String, dynamic> jsonResult = await fileManager.loadDataDictinary();
    Map<String, dynamic> config = await fileManager.loadConfigFile();
    int wordsAtTest = config['wordsAtTest'] ?? 10;
    var res = jsonResult['dictionary'];
    initTestWords(res, wordsAtTest);
    this.testResults = {currentWord: []};
    notifyListeners();
  }

  void replay() {
    this.testIndex = 0;
    onCreated();
  }

  double get testPrecent => testIndex / maxIndex * 100;

  void initTestWords(List<dynamic> dictionary, int listLength) {
    List<HebWord> hebWordList = [];
    for (final wordValue in dictionary) {
      HebWord word = HebWord(wordValue['word'], wordValue['translation'],
          wordValue['example'], wordValue['score']);
      hebWordList.add(word);
    }
    hebWordList = hebWordList
        .where((element) => element.knownWordScore != element.score)
        .toList();
    hebWordList.sort((a, b) => a.score.compareTo(b.score));
    this.testWords = hebWordList.sublist(0, listLength);
  }

  bool _showAnswer = false;
  bool get showAnswer => _showAnswer;
  set showAnswer(bool value) {
    _showAnswer = value;
    notifyListeners();
  }

  bool get showTranslation {
    bool testResUnknow =
        testResults[currentWord]?.contains(test_unknow) ?? false;
    bool testResKnow = testResults[currentWord]?.contains(test_know) ?? false;
    return showAnswer || testResUnknow || testResKnow;
  }

  bool get isKnowCurrentWord =>
      testResults[currentWord]?.contains(test_know) ?? false;

  bool get isAnswerdCurrentWord =>
      getStatus.contains(test_know) || getStatus.contains(test_unknow);

  int get testIndex => _testIndex;
  set testIndex(int value) {
    if (maxIndex + 1 > value) {
      _testIndex = value;
      notifyListeners();
    }
  }

  void incrementsTestIndex() {
    testIndex = testIndex + 1;
  }

  void testResultsAppend(String action) {
    if (!testResults.containsKey(currentWord)) {
      testResults[currentWord] = <String>[];
    }
    if (action == test_unknow ||
        testResults[currentWord].contains(test_unknow)) {
      testResults[currentWord] = [test_unknow];
    } else {
      testResults[currentWord].add(action);
    }
    notifyListeners();
  }

  List<String> get getStatus {
    return testResults[currentWord] ?? [];
  }

  bool get isHintCurrentWord => getStatus.contains(test_hint);

  int get maxIndex => testWords.length;
  HebWord get currentWord => testWords[testIndex];
  bool get isDone => testIndex == maxIndex;
}
