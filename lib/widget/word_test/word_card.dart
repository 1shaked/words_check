import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(child: Text('Test word'), color: Colors.blue[400]),
    );
  }
}
