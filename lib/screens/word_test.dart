import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/test_config.dart';
import 'package:word_me/models/test_maneger.dart';
import 'package:word_me/models/words_dictionary.dart';
import 'package:word_me/widget/nav_drawer.dart';
import 'package:word_me/widget/word_test_body.dart';

class WordTest extends StatefulWidget {
  @override
  _WordTestState createState() => _WordTestState();
}

class _WordTestState extends State<WordTest> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WordsDictionary()),
        ChangeNotifierProvider(create: (context) => TestConfig()),
        ChangeNotifierProvider(create: (context) => TestManeger())
      ],
      child: Scaffold(
          appBar: AppBar(title: Text('Test ME')),
          drawer: NavDrawer(),
          body: WordTestBody()),
    );
  }
}
