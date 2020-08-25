import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/test_maneger.dart';
import 'package:word_me/widget/word_test/do_know.dart';
import 'package:word_me/widget/word_test/get_uses.dart';
import 'package:word_me/widget/word_test/next_question.dart';
import 'package:word_me/widget/word_test/show_answer.dart';
import 'package:word_me/widget/word_test/test_words_index.dart';
import 'package:word_me/widget/word_test/word_card.dart';
import 'package:word_me/widget/word_test/word_status.dart';
import 'package:provider/provider.dart';

class WordTestBody extends StatefulWidget {
  @override
  _WordTestBodyState createState() => _WordTestBodyState();
}

class _WordTestBodyState extends State<WordTestBody> {
  @override
  Widget build(BuildContext context) {
    TestManeger testManeger = Provider.of<TestManeger>(context);

    return Container(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Stack(children: <Widget>[
            Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: testManeger.isDone
                      ? [
                          Text('YOU ARE DONE!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold)),
                          FlatButton.icon(
                              color: Colors.greenAccent,
                              onPressed: () {
                                testManeger.replay();
                              },
                              icon: Icon(Icons.replay),
                              label: Text('REPLAY'))
                        ]
                      : [
                          WordStatus(),
                          WordCard(),
                          DoYouKnow(),
                          GetUses(),
                          ShowAnswer(),
                          NextQuestion(),
                          TestWordsIndex()
                        ],
                ))
          ]),
        ),
      ),
    );
  }
}
