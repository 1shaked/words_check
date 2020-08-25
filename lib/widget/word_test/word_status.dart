import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/test_maneger.dart';
import 'package:word_me/const/test_conditions.dart';
import 'package:word_me/models/words_dictionary.dart';

class WordStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestManeger testManeger = Provider.of<TestManeger>(context);
    WordsDictionary wordsDictionary = Provider.of<WordsDictionary>(context);
    return Container(
      child: testManeger.isKnowCurrentWord
          ? knowWord(testManeger, wordsDictionary)
          : testManeger.isAnswerdCurrentWord
              ? unknowWord(testManeger)
              : Container(
                  child: Card(
                    child: Text(
                        'You did ${testManeger.testIndex} out of ${testManeger.maxIndex}'),
                  ),
                ),
    );
  }

  Widget knowWord(TestManeger testManeger, WordsDictionary wordsDictionary) {
    return Container(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 5,
                child: Container(
                  color: Colors.green,
                  child: FlatButton.icon(
                      onPressed: () {
                        testManeger.incrementsTestIndex();
                      },
                      icon: Icon(Icons.thumb_up, color: Colors.white),
                      label: Text(
                        'did know this',
                        style: TextStyle(color: Colors.black),
                      )),
                )),
            Expanded(
                flex: 5,
                child: Container(
                  color: Colors.redAccent,
                  child: FlatButton.icon(
                      splashColor: Colors.green,
                      onPressed: () {
                        testManeger.testResultsAppend(test_unknow);
                        if (testManeger.currentWord.score - 1 ==
                            testManeger.currentWord.knownWordScore) {
                          wordsDictionary.changeScore(testManeger.currentWord,
                              testManeger.currentWord.unknownWordScore);
                        } else {
                          wordsDictionary.changeScore(testManeger.currentWord,
                              testManeger.currentWord.score - 1);
                        }
                        testManeger.incrementsTestIndex();
                      },
                      icon: Icon(
                        Icons.thumb_down,
                        color: Colors.white,
                      ),
                      label: Text(
                        'did not know',
                        style: TextStyle(color: Colors.white),
                      )),
                )),
          ],
        ),
      ),
    );
  }

  Widget unknowWord(TestManeger testManeger) {
    return Container(
      child: FlatButton.icon(
          onPressed: () => testManeger.incrementsTestIndex(),
          icon: Icon(Icons.arrow_forward),
          label: Text('Go To The Next Page')),
    );
  }
}
