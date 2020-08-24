import 'package:flutter/material.dart';

class Translations extends StatelessWidget {
  final List<String> translations;

  Translations(this.translations);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: ListView.builder(
          itemCount: translations.length,
          itemBuilder: (context, index) {
            int number = index + 1;
            return Text('$number ${translations[index]}');
          },
          shrinkWrap: true),
    );
  }
}
