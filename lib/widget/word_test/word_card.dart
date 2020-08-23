import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/test_maneger.dart';

class WordCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestManeger testManeger = Provider.of<TestManeger>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Card(
          child: Container(
            child: Text(testManeger.currentWord.word,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                )),
          ),
          color: Colors.blue[100]),
    );
  }
}
