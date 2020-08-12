import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/words_dictionary.dart';
import 'package:flutter/services.dart';


class PageConntroller extends StatefulWidget {
  @override
  _PageConntrollerState createState() => _PageConntrollerState();
}

class _PageConntrollerState extends State<PageConntroller> {
  String error;
  @override
  Widget build(BuildContext context) {
    WordsDictionary wordsDictionary = Provider.of<WordsDictionary>(context);
    final _formKey = GlobalKey<FormState>();

    return Container(
      child: Column(
        children: <Widget>[
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
              Text('The max page is ${wordsDictionary.maxPage}')
            ],
          ),
          Form(
              key: _formKey,
              child: Row(
              children: <Widget>[
                SizedBox(
                  width: 280,
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    onFieldSubmitted: (e) {
                      if (_formKey.currentState.validate()) {
                        wordsDictionary.page =  int.parse(e);
                      }
                    },
                    validator: (value) {
                      try {
                        return  int.parse(value) < wordsDictionary.maxPage ? null : 'pls provide a number in the range of 0 - ${wordsDictionary.maxPage}';
                      } catch (err) {
                        return 'no value here';
                      }
                    },
                    decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter a page 0 to ${wordsDictionary.maxPage}',
                  ),
                  ),
                )
              ]
            ),
          ),
        ],
      )  
    );
  }
}