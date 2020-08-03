import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:word_me/models/heb_word.dart';


class WordListItem extends StatelessWidget {
  final HebWord word;
  WordListItem(this.word);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text('${word.word}'),
      ),
    );
  }
}