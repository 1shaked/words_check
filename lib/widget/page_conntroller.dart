import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/words_dictionary.dart';
import 'package:flutter/services.dart';
import 'package:word_me/models/filter.dart';

class PageConntroller extends StatefulWidget {
  @override
  _PageConntrollerState createState() => _PageConntrollerState();
}

class _PageConntrollerState extends State<PageConntroller> {
  String error;
  String dropdownValue;
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
            IconButton(
                icon: Icon(Icons.plus_one),
                onPressed: () {
                  print('plus');
                  wordsDictionary.changePagaNumber(1);
                }),
            Text(wordsDictionary.page.toString() ?? 'no page'),
            IconButton(
                icon: Icon(Icons.exposure_neg_1),
                onPressed: () {
                  print('minues');
                  wordsDictionary.changePagaNumber(-1);
                }),
            Text('The max page is ${wordsDictionary.maxPage}')
          ],
        ),
        Form(
          key: _formKey,
          child: Row(children: <Widget>[
            Column(
              children: [
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
                        wordsDictionary.page = int.parse(e);
                      }
                    },
                    validator: (value) {
                      try {
                        return int.parse(value) < wordsDictionary.maxPage
                            ? null
                            : 'pls provide a number in the range of 0 - ${wordsDictionary.maxPage}';
                      } catch (err) {
                        return 'no value here';
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter a page 0 to ${wordsDictionary.maxPage}',
                    ),
                  ),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      wordsDictionary.filter = dropdownValue;
                    });
                  },
                  items: <String>[
                    none_filter,
                    unknown_filter,
                    known_filter,
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ]),
        ),
      ],
    ));
  }
}
