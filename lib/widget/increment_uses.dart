import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/words_dictionary.dart';

class IncrementUses extends StatefulWidget {
  @override
  _IncrementUsesState createState() => _IncrementUsesState();
}

class _IncrementUsesState extends State<IncrementUses> {
  @override
  Widget build(BuildContext context) {
    WordsDictionary wordsDictionary = Provider.of<WordsDictionary>(context);

    return Container(
      child: FlatButton(onPressed: () {
        print('click');
        wordsDictionary.increments();
      }, child: Text('ADD ONE'))
    );
  }
}