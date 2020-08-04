import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/words_dictionary.dart';
import 'package:word_me/widget/increment_uses.dart';
import 'package:word_me/widget/page_conntroller.dart';
import 'package:word_me/widget/show_uses.dart';
import 'package:word_me/widget/word_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => WordsDictionary()),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text('home page!')
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
            )      
          ),
        ),
    );
  }
}