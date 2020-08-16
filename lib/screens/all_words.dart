import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/words_dictionary.dart';
import 'package:word_me/widget/nav_drawer.dart';
import 'package:word_me/widget/page_conntroller.dart';
import 'package:word_me/widget/word_list.dart';

class AllWords extends StatefulWidget {
  @override
  _AllWordsState createState() => _AllWordsState();
}

class _AllWordsState extends State<AllWords> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WordsDictionary()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('All words!')),
        drawer: NavDrawer(),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            PageConntroller(),
            SizedBox(
              child: WordList(),
              height: 500,
            ),
          ],
        )),
      ),
    );
  }
}
