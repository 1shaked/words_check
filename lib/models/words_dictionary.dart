import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:word_me/models/heb_word.dart';

class WordsDictionary extends ChangeNotifier {
  List<HebWord> _dictionary;
  int _uses = 150;
  int _page = 0;
  int _maxItems = 10;

  WordsDictionary() {
    loadDictionary();
  }

  loadDictionary () async {
    String data = await rootBundle.loadString('assets/heb_list.json');
    this._dictionary ??= [];
    var jsonResult = json.decode(data);
    var res = jsonResult['dictionary'];
    for (final wordValue in res) {
      print(wordValue['word']);
      HebWord word = HebWord(wordValue['word'],wordValue['translation'] ,wordValue['example'],wordValue['score']);
      this._dictionary.add(word);
    }
    print(dictionary);
    notifyListeners();
  }

  int get max_page => (_dictionary.length / _maxItems).round(); 
  int get uses => _uses;
  int get page => _page;
  List get dictionary => _dictionary;

  List get current_dictionary {
    int start = _page * _maxItems;
    int end   = start + _maxItems;
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
  increments () {
    uses += 1;
  }

  changePagaNumber (n) {
    page += n; 
  }
  
}