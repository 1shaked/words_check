import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/heb_word.dart';
import 'package:word_me/models/words_dictionary.dart';
import 'package:word_me/widget/WordUses.dart';
import 'package:word_me/widget/translations.dart';

class WordListItem extends StatefulWidget {
  final HebWord word;
  final int index;
  WordListItem(this.word, this.index);

  @override
  _WordListItemState createState() => _WordListItemState();
}

class _WordListItemState extends State<WordListItem> {
  bool isOpen = false;

  Future<void> _showMyDialog(WordsDictionary dictionary) async {
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
                setState(() {
                  isOpen = false;
                });
                dictionary.changeScore(widget.word, widget.word.knownWordScore);
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
    WordsDictionary wordsDictionary = Provider.of<WordsDictionary>(context);

    return Container(
      color: widget.word.score == widget.word.knownWordScore
          ? Colors.green[400]
          : widget.word.score == widget.word.unknownWordScore
              ? Colors.redAccent
              : Colors.white,
      child: ListTile(
        leading: const Icon(Icons.comment),
        title: Text(
          '${widget.word.word}',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
            isOpen
                ? widget.word.translation
                : widget.word.score == widget.word.knownWordScore
                    ? ''
                    : widget.word.score.toString(),
            style: TextStyle(
              fontSize: isOpen ? 20 : 15,
              fontWeight: FontWeight.normal,
            )),
        onTap: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
        onLongPress: () {
          // TODO: change to move to explain button
          print('long press');
          _showMyDialog(wordsDictionary);
        },
      ),
    );
  }
}
