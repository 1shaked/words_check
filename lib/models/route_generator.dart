import 'package:flutter/material.dart';
import 'package:word_me/screens/analytics.dart';
import 'package:word_me/screens/home.dart';
import 'package:word_me/screens/settings.dart';
import 'package:word_me/screens/word_test.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/settings':
        return MaterialPageRoute(builder: (_) => Settings());
      case '/word_test':
        return MaterialPageRoute(builder: (_) => WordTest());
      case '/analytics':
        return MaterialPageRoute(builder: (_) => Analytics());
      default:
        // If there is no such named route in the switch statement
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
