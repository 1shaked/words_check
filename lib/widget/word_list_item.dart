import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:word_me/models/heb_word.dart';
import 'package:word_me/widget/WordUses.dart';
import 'package:word_me/widget/translations.dart';


class WordListItem extends StatefulWidget {
  final HebWord word;
  WordListItem(this.word);

  @override
  _WordListItemState createState() => _WordListItemState();
}

class _WordListItemState extends State<WordListItem> {
  bool isOpen = false;


  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${widget.word.word}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Translations(widget.word.translationsList),
                WordUses(widget.word.exampleList),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('ידעתי'),
              color: Colors.green[700],
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('לא ידעתי'),
              color: Colors.red[400],
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: const Icon(Icons.comment),
        title: Text('${widget.word.word}'),
        subtitle: Text(
          isOpen ? widget.word.translation : '',
          style: TextStyle(
            fontSize: isOpen ? 20 : 0,
            fontWeight: FontWeight.normal,
          )
        ),
        onTap: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
        onLongPress: () {
          // TODO: change to move to explain button
          print('long press');
          _showMyDialog();
        },
      ),
    );
  }
}

