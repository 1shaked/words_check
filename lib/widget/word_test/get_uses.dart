import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/const/test_conditions.dart';
import 'package:word_me/models/test_maneger.dart';

class GetUses extends StatefulWidget {
  @override
  _GetUsesState createState() => _GetUsesState();
}

class _GetUsesState extends State<GetUses> {
  bool didGetHint = false;
  @override
  Widget build(BuildContext context) {
    TestManeger testManeger = Provider.of<TestManeger>(context);
    return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: testManeger.isHintCurrentWord
            ? showUses(testManeger)
            : needHint(testManeger));
  }

  Widget needHint(TestManeger testManeger) {
    return Container(
      child: Container(
        child: RaisedButton.icon(
            color: Colors.blueAccent,
            padding: EdgeInsets.all(15),
            onPressed: () {
              testManeger.testResultsAppend(test_hint);
            },
            icon: Icon(Icons.help_outline, color: Colors.white),
            label: Text('Get Help!',
                style: TextStyle(color: Colors.white, fontSize: 20))),
      ),
    );
  }

  Widget showUses(TestManeger maneger) {
    return Container(
        padding: EdgeInsets.all(10),
        color: Colors.redAccent,
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: ListView.builder(
              itemCount: maneger.currentWord.exampleList.length,
              itemBuilder: (_, index) => Text(
                  maneger.currentWord.exampleList[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        ));
  }
}
