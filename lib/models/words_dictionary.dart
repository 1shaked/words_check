import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:word_me/models/file_maneger.dart';
import 'package:word_me/models/filter.dart';

import 'package:word_me/models/heb_word.dart';

class WordsDictionary extends ChangeNotifier {
  List<HebWord> _dictionary;
  int _uses = 0;
  int _page = 0;
  int _maxItems = 10;
  String _filter = none_filter;
  FileManager fileManeger = FileManager();

  bool _isDoneLoading = false;
  bool get isDoneLoading => _isDoneLoading;
  set isDoneLoading(bool v) {
    _isDoneLoading = v;
    notifyListeners();
  }

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
    this.uses = jsonResult['uses'];
    for (final wordValue in res) {
      HebWord word = HebWord(wordValue['word'], wordValue['translation'],
          wordValue['example'], wordValue['score']);
      this._dictionary.add(word);
    }
    isDoneLoading = true;
    notifyListeners();
  }

  int get maxPage {
    List<dynamic> currentList = dictionary ?? [];
    return (currentList.length / _maxItems).round();
  }

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
      'uses': this.uses,
    });
    fileManeger.updateDataDictionary(data);
    notifyListeners();
  }

  int get wordTested {
    List<HebWord> currentDictionary = this.dictionary ?? [];
    if (currentDictionary.isEmpty) {
      return 0;
    }
    return currentDictionary
        .where((element) =>
            element.score != element.knownWordScore &&
            element.score != element.unknownWordScore)
        .toList()
        .length;
  }

  int get wordKnown {
    List<HebWord> currentDictionary = this.dictionary ?? [];
    if (currentDictionary.isEmpty) {
      return 0;
    }
    return currentDictionary
        .where((element) => element.score == element.knownWordScore)
        .toList()
        .length;
  }

  double get precentTested {
    List<HebWord> currentDictionary = this.dictionary ?? [];
    if (currentDictionary.isEmpty) {
      return 0;
    }
    return this.wordTested / currentDictionary.length;
  }

  double get precentKnown {
    List<HebWord> currentDictionary = this.dictionary ?? [];
    if (currentDictionary.isEmpty) {
      return 0;
    }
    return currentDictionary
            .where((element) => element.score == element.knownWordScore)
            .toList()
            .length /
        currentDictionary.length;
  }
}
