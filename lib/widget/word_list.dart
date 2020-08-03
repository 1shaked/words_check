import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/heb_word.dart';
import 'package:word_me/models/words_dictionary.dart';
import 'package:word_me/widget/word_list_item.dart';

class WordList extends StatefulWidget {
  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  @override
  Widget build(BuildContext context) {
    WordsDictionary words_dictionary = Provider.of<WordsDictionary>(context);
    if (words_dictionary.current_dictionary  != null) {
      return Container(
        child: ListView(
          children: words_dictionary.current_dictionary.map((w) => WordListItem(w)).toList()
        ),
      );
    } else {
      return Text('no data here');
    }
  }
}

