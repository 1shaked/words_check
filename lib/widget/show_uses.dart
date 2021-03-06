import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/words_dictionary.dart';

class Uses extends StatefulWidget {
  @override
  _UsesState createState() => _UsesState();
}

class _UsesState extends State<Uses> {
  @override
  Widget build(BuildContext context) {
    WordsDictionary wordsDictionary = Provider.of<WordsDictionary>(context);
    return Container(
      child: Text(wordsDictionary.page.toString() ?? 'no page'),
    );
  }
}
