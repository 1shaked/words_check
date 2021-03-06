import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/words_dictionary.dart';
import 'package:word_me/widget/word_list_item.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WordList extends StatefulWidget {
  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  @override
  Widget build(BuildContext context) {
    WordsDictionary wordsDictionary = Provider.of<WordsDictionary>(context);

    if (wordsDictionary.isDoneLoading) {
      return Container(
        child: ListView(
            children:
                wordsDictionary.currentDictionary.asMap().entries.map((entry) {
              int idx = entry.key;
              return WordListItem(entry.value, idx);
            }).toList(),
            shrinkWrap: true),
      );
    } else {
      return Container(child: const SpinKitRotatingCircle(color: Colors.white));
    }
  }
}
