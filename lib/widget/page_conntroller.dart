import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/words_dictionary.dart';

class PageConntroller extends StatefulWidget {
  @override
  _PageConntrollerState createState() => _PageConntrollerState();
}

class _PageConntrollerState extends State<PageConntroller> {
  @override
  Widget build(BuildContext context) {
    WordsDictionary wordsDictionary = Provider.of<WordsDictionary>(context);

    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              // TextField(
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //     hintText: 'Enter a search term'
              //   ),
              // )
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(icon: Icon(Icons.plus_one), onPressed: () {
                print('plus');
                wordsDictionary.changePagaNumber(1);
              }),
              Text(wordsDictionary.page.toString() ??  'no page'),
              IconButton(icon: Icon(Icons.exposure_neg_1), onPressed: () {
                print('minues');
                wordsDictionary.changePagaNumber(-1);
              }),
              Text('The max page is ${wordsDictionary.max_page}')
            ],
          ),
        ],
      )  
    );
  }
}