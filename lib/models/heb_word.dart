import 'package:quiver/core.dart';

class HebWord {
  String word;
  String translation;
  String example;
  int score;
  int knownWordScore = -1;
  int unknownWordScore = 0;
  HebWord(this.word, this.translation, this.example, this.score);

  List<String> get translationsList => splitText(translation);
  List<String> get exampleList => splitText(example);

  @override
  String toString() {
    return super.toString() + ' ${this.word} ${this.score}';
  }

  List<String> splitText(String text) {
    if (!text.contains('.')) {
      return [text];
    }
    List<String> textSplited = text.split('.');
    for (int i = 0; i < textSplited.length; i++) {
      if (textSplited[i].length == 0) continue;
      if ('0123456789'.contains(textSplited[i][0])) {
        String firstChar = textSplited[i][0];
        textSplited[i].replaceFirst(firstChar, ' ');
      }
    }
    return textSplited;
  }

  Map<String, dynamic> toJson() => {
        'word': this.word,
        'translation': this.translation,
        'example': this.example,
        'score': this.score
      };

  bool operator ==(o) =>
      o is HebWord &&
      o.word == word &&
      o.translation == translation &&
      o.example == example;
  int get hashCode =>
      hash3(word.hashCode, translation.hashCode, example.hashCode);
}
