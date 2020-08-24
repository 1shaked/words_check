import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:word_me/models/test_config.dart';

class FileManager {
  String configFileName = 'config.json';
  File configFile;
  String fileName = 'track.json';
  File jsonFile;

  Future<Map<String, dynamic>> loadConfigFile(TestConfig testConfig) async {
    Directory directory = await getApplicationDocumentsDirectory();
    this.configFile = new File(directory.path + "/" + this.configFileName);

    if (this.configFile.existsSync()) {
      String data = this.configFile.readAsStringSync();
      Map<String, dynamic> jsonData = json.decode(data);
      return jsonData;
    } else {
      updateFileConfig(testConfig);
      return testConfig.toJson();
    }
  }

  void updateFileConfig(TestConfig testConfig) async {
    Map<String, dynamic> res = testConfig.toJson();
    this.configFile.writeAsString(json.encode(res));
  }

  Future<Map<String, dynamic>> loadDataDictinary() async {
    Directory directory = await getApplicationDocumentsDirectory();
    this.jsonFile = new File(directory.path + "/" + this.fileName);
    bool fileExists = jsonFile.existsSync();
    String data = fileExists
        ? await jsonFile.readAsString()
        : await rootBundle.loadString('assets/heb_list.json');
    if (!fileExists) {
      jsonFile.writeAsString(data);
    }
    return json.decode(data);
  }

  void updateDataDictionary(String data) => this.jsonFile.writeAsString(data);
}
