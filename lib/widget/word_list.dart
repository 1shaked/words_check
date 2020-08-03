import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/words_dictionary.dart';
import 'package:word_me/widget/word_list_item.dart';

class WordList extends StatefulWidget {
  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  @override
  Widget build(BuildContext context) {
    WordsDictionary wordsDictionary = Provider.of<WordsDictionary>(context);
    if (wordsDictionary.current_dictionary  != null) {
      return Container(
        child: ListView(
          children: wordsDictionary.current_dictionary.map((w) => WordListItem(w)).toList()
        ),
      );
    } else {
      return Text('no data here');
    }
  }
}

