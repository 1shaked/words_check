import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/words_dictionary.dart';
import 'package:word_me/widget/page_conntroller.dart';
import 'package:word_me/widget/word_list.dart';

class UnknownWords extends StatefulWidget {
  @override
  _UnknownWordsState createState() => _UnknownWordsState();
}

class _UnknownWordsState extends State<UnknownWords> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WordsDictionary()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('home page!')),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Ttem 1"),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: Text("Item 2"),
                trailing: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
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
