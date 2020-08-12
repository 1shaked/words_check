import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:word_me/models/heb_word.dart';

class WordsDictionary extends ChangeNotifier {
  List<HebWord> _dictionary;
  int _uses = 150;
  int _page = 0;
  int _maxItems = 10;
  String fileName = 'track.json';

  WordsDictionary() {
    
    loadData();
  }

  loadData() async {
    Directory directory = await getApplicationDocumentsDirectory();
    File jsonFile = new File(directory.path + "/" + this.fileName);
    bool fileExists = jsonFile.existsSync();
    String data = fileExists ? await jsonFile.readAsString() :  await rootBundle.loadString('assets/heb_list.json');
    loadDictionary(data);
    if (!fileExists) {
      jsonFile.writeAsString(data);
    }
  }
  loadDictionary (String data) async {
    
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

  int get maxPage => (_dictionary.length / _maxItems).round(); 
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