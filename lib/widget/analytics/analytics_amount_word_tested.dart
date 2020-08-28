import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/words_dictionary.dart';

class AmountWordTested extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WordsDictionary wordsDictionary = Provider.of<WordsDictionary>(context);
    return Container(
      color: Colors.blueAccent,
      padding: EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Tested on ${wordsDictionary.wordTested}',
              style: TextStyle(fontSize: 20),
            ),
            Text('Known Words ${wordsDictionary.wordKnown}',
                style: TextStyle(fontSize: 20))
          ]),
    );
  }
}
