import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:word_me/models/heb_word.dart';

enum Filters { none, known, unknown }

class WordsDictionary extends ChangeNotifier {
  List<HebWord> _dictionary;
  int _uses = 150;
  int _page = 0;
  int _maxItems = 10;
  String fileName = 'track.json';
  File jsonFile;
  Filters filters = Filters.none;

  WordsDictionary() {
    loadData();
  }

  loadData() async {
    Directory directory = await getApplicationDocumentsDirectory();
    this.jsonFile = new File(directory.path + "/" + this.fileName);
    bool fileExists = jsonFile.existsSync();
    String data = fileExists
        ? await jsonFile.readAsString()
        : await rootBundle.loadString('assets/heb_list.json');
    loadDictionary(data);
    if (!fileExists) {
      jsonFile.writeAsString(data);
    }
  }

  loadDictionary(String data) async {
    this._dictionary ??= [];
    var jsonResult = json.decode(data);
    var res = jsonResult['dictionary'];
    for (final wordValue in res) {
      print(wordValue['word']);
      HebWord word = HebWord(wordValue['word'], wordValue['translation'],
          wordValue['example'], wordValue['score']);
      this._dictionary.add(word);
    }
    print(dictionary);
    notifyListeners();
  }

  int get maxPage => (_dictionary.length / _maxItems).round();
  int get uses => _uses;
  int get page => _page;
  List get dictionary => _dictionary;

  List get currentDictionary {
    int start = _page * _maxItems;
    int end = start + _maxItems;

    switch (filters) {
      case Filters.none:
        return this._dictionary.sublist(start, end);
      case Filters.known:
        return this
            ._dictionary
            .where((element) => element.score == -1)
            .toList();
      case Filters.unknown:
        return this
            ._dictionary
            .where((element) => element.score != -1)
            .toList();
    }
    return this._dictionary.sublist(start, end);
  }

  List get unknownWords {
    return this._dictionary.where((element) => element.score != -1).toList();
  }

  List get knownWords {
    return this._dictionary.where((element) => element.score == -1).toList();
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

  void changeScore(int index, int score) {
    // this is -1 for word you for sure now
    this._dictionary[index].score = score;
    String data = json.encode(this._dictionary);
    this.jsonFile.writeAsString(data);
    notifyListeners();
  }
}
