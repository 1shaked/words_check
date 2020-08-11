import 'package:flutter/material.dart';

class WordUses extends StatelessWidget {
  final List<String> examples;
  @override 
  WordUses(this.examples);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 200,
      child: ListView.builder(
        itemCount: examples.length,
        itemBuilder: (context, index) => Text(examples[index]) 
      ),
    );
  }
}