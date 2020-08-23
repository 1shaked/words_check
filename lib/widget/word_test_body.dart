import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/test_config.dart';
import 'package:word_me/models/test_maneger.dart';
import 'package:word_me/models/words_dictionary.dart';
import 'package:word_me/widget/word_test/do_know.dart';
import 'package:word_me/widget/word_test/get_uses.dart';
import 'package:word_me/widget/word_test/next_question.dart';
import 'package:word_me/widget/word_test/show_answer.dart';
import 'package:word_me/widget/word_test/word_card.dart';

class WordTestBody extends StatefulWidget {
  @override
  _WordTestBodyState createState() => _WordTestBodyState();
}

class _WordTestBodyState extends State<WordTestBody> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    WordsDictionary wordsDictionary = Provider.of<WordsDictionary>(context);
    TestConfig testConfig = Provider.of<TestConfig>(context);
    print('HERE');
    print(wordsDictionary.wordForTest(testConfig.wordsAtTest));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => TestManeger(
                wordsDictionary.wordForTest(testConfig.wordsAtTest)))
      ],
      child: Container(
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
                  children: [
                    WordCard(),
                    DoYouKnow(),
                    GetUses(),
                    ShowAnswer(),
                    NextQuestion()
                  ],
                ))
          ]),
        ),
      )),
    );
  }
}
