import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/words_dictionary.dart';

class PrecentWordTested extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WordsDictionary wordsDictionary = Provider.of<WordsDictionary>(context);
    return Container(
      color: Colors.greenAccent,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Tested ${wordsDictionary.precentTested.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 20)),
          Text('Known ${wordsDictionary.precentKnown.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
