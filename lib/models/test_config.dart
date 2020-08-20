import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class TestConfig extends ChangeNotifier {
  String _name = 'example';
  int _wordsAtTest = 30;
  int _wordsAtDay = 10;
  List<TimeOfDay> _frequency = [TimeOfDay(hour: 15, minute: 0)];
  String configFileName = 'config.json';
  File configFile;

  TestConfig() {}

  void updateFileConfig() async {
    Directory directory = await getApplicationDocumentsDirectory();
    this.configFile = new File(directory.path + "/" + this.configFileName);
    bool fileExists = this.configFile.existsSync();
    if (!fileExists) {
      this.configFile.writeAsString(json.encode(this.toJson()));
    }
  }

  String get name => _name;
  int get wordsAtTest => _wordsAtTest;
  int get wordsAtDay => _wordsAtDay;
  List<TimeOfDay> get frequency => _frequency;
  int get numberOfTimeADays => frequency.length;

  set name(value) {
    _name = value;
    notifyListeners();
  }

  set wordsAtTest(value) {
    _wordsAtTest = value;
    notifyListeners();
  }

  set wordsAtDay(value) {
    _wordsAtDay = value;
    notifyListeners();
  }

  set frequency(value) {
    _frequency = value;
    notifyListeners();
  }

  void changeFrequencyAtIndex(int index, TimeOfDay value) {
    frequency[index] = value;
    notifyListeners();
  }

  void addFrequency() {
    frequency.add(TimeOfDay.now());
    notifyListeners();
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'wordsAtTest': wordsAtTest,
        'frequency': frequency,
        'wordsAtDay': wordsAtDay
      };
  @override
  String toString() {
    return 'name {name} and the frequency is {frequency}.' +
        ' and you are going to test on {wordsAtTest} every day';
  }
}
