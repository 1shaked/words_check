import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:word_me/models/heb_word.dart';


class WordListItem extends StatefulWidget {
  final HebWord word;
  WordListItem(this.word);

  @override
  _WordListItemState createState() => _WordListItemState();
}

class _WordListItemState extends State<WordListItem> {
  bool isOpen = false;
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
          print('click onLongPress');
        },
      ),
    );
  }
}