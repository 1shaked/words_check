import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:word_me/models/file_maneger.dart';
import 'package:word_me/models/filter.dart';

import 'package:word_me/models/heb_word.dart';

class WordsDictionary extends ChangeNotifier {
  List<HebWord> _dictionary;
  int _uses = 150;
  int _page = 0;
  int _maxItems = 10;
  String _filter = none_filter;
  FileManager fileManeger = FileManager();

  WordsDictionary() {
    loadDictionary();
  }
  String get filter => _filter;
  set filter(String name) {
    _filter = name;
    notifyListeners();
  }

  loadDictionary() async {
    Map<String, dynamic> jsonResult = await fileManeger.loadDataDictinary();
    this._dictionary ??= [];
    var res = jsonResult['dictionary'];
    for (final wordValue in res) {
      HebWord word = HebWord(wordValue['word'], wordValue['translation'],
          wordValue['example'], wordValue['score']);
      this._dictionary.add(word);
    }
    notifyListeners();
  }

  int get maxPage => (_dictionary.length / _maxItems).round();
  int get uses => _uses;
  int get page => _page;
  List get dictionary => _dictionary;

  List get currentDictionary {
    int start = _page * _maxItems;
    int end = start + _maxItems;

    switch (_filter) {
      case none_filter:
        return this._dictionary.sublist(start, end);
      case known_filter:
        return this
            ._dictionary
            .where((element) => element.score == element.knownWordScore)
            .toList()
            .sublist(start, end);
      case unknown_filter:
        return this
            ._dictionary
            .where((element) => element.score != element.knownWordScore)
            .toList()
            .sublist(start, end);
    }
    return this._dictionary.sublist(start, end);
  }

  set uses(int n) {
    _uses = n;
    notifyListeners();
  }

  set page(int p) {
    _page = p;
    notifyListeners();
  }

  void increments() {
    this.uses += 1;
  }

  void changePagaNumber(int n) {
    this.page += n;
  }

  void changeScore(HebWord word, int score) {
    int index = this._dictionary.indexOf(word);
    // this is -1 for word you for sure now
    this._dictionary[index].score = score;
    String data = json.encode({
      'dictionary': this._dictionary,
      'uses': this._uses,
    });
    fileManeger.updateDataDictionary(data);
    notifyListeners();
  }

  List<HebWord> wordForTest(int numberOfWords) {
    List<HebWord> testWords = dictionary
        .where((element) => element.knownWordScore != element.score)
        .toList();
    testWords.sort((a, b) => a.score.compareTo(b.score));
    return testWords.sublist(0, numberOfWords);
  }
}
