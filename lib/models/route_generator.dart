import 'package:flutter/material.dart';
import 'package:word_me/screens/all_words.dart';
import 'package:word_me/screens/home.dart';
import 'package:word_me/screens/known.dart';
import 'package:word_me/screens/unknown.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/all_words':
        return MaterialPageRoute(builder: (_) => AllWords());
      case '/known':
        return MaterialPageRoute(builder: (_) => KnownWords());
      case '/unknown':
        return MaterialPageRoute(builder: (_) => UnknownWords());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
