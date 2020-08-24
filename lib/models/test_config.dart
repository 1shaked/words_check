import 'package:flutter/material.dart';
import 'package:word_me/models/file_maneger.dart';

class TestConfig extends ChangeNotifier {
  String _name = 'example';
  int _wordsAtTest = 30;
  int _wordsAtDay = 10;
  List<TimeOfDay> _frequency = [TimeOfDay(hour: 15, minute: 0)];
  FileManager fileManeger = FileManager();

  TestConfig() {
    onCreated();
  }

  void onCreated() async {
    Map<String, dynamic> jsonData = await fileManeger.loadConfigFile(this);
    this._frequency = jsonData['frequency'].map<TimeOfDay>((e) {
      List<String> timeList = e.split(':');
      int hour = int.parse(timeList[0]);
      int minute = int.parse(timeList[1]);
      return TimeOfDay(hour: hour, minute: minute);
    }).toList();

    this.wordsAtTest = jsonData['wordsAtTest'];
    this.wordsAtDay = jsonData['wordsAtDay'];
    this.name = jsonData['name'];
  }

  void updateFileConfig() async {
    fileManeger.updateFileConfig(this);
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
        'frequency': frequency.map((e) => '${e.hour}:${e.minute}').toList(),
        'wordsAtDay': wordsAtDay
      };
  @override
  String toString() {
    return 'name ${this.name} and the frequency is ${this.frequency}.' +
        ' and you are going to test on ${this.wordsAtTest} every day';
  }
}
