import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/const/test_conditions.dart';
import 'package:word_me/models/test_maneger.dart';
import 'package:word_me/models/words_dictionary.dart';

class DoYouKnow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestManeger testManeger = Provider.of<TestManeger>(context);
    WordsDictionary wordsDictionary = Provider.of<WordsDictionary>(context);
    return Container(
      child: SizedBox(
        height: 40,
        child: !testManeger.isAnswerdCurrentWord
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.black,
                    child: FlatButton.icon(
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
                        },
                        icon: Icon(Icons.cancel, color: Colors.white),
                        label: Text("did'nt know",
                            style: TextStyle(color: Colors.white))),
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.green,
                    child: FlatButton.icon(
                        onPressed: () {
                          testManeger.testResultsAppend(test_know);
                          if (testManeger.currentWord.score !=
                              testManeger.currentWord.knownWordScore) {
                            wordsDictionary.changeScore(testManeger.currentWord,
                                testManeger.currentWord.score + 1);
                            testManeger.currentWord.score += 1;
                          }
                        },
                        icon: Icon(Icons.check_circle, color: Colors.white),
                        label: Text("did know!",
                            style: TextStyle(
                              color: Colors.white,
                            ))),
                  )),
                ],
              )
            : Container(),
      ),
    );
  }
}
