import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/widget/analytics/analytics_amount_of_uses.dart';
import 'package:word_me/widget/analytics/analytics_amount_word_tested.dart';
import 'package:word_me/widget/analytics/analytics_precent_word_tested.dart';
import 'package:word_me/widget/nav_drawer.dart';
import 'package:word_me/models/words_dictionary.dart';
// import 'package:word_me/widget/word_list_item.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class Analytics extends StatefulWidget {
  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WordsDictionary()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('Analytics page!')),
        drawer: NavDrawer(),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: AmountWordTested()),
                Expanded(flex: 5, child: PrecentWordTested())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: AmountAppUses()),
                Expanded(flex: 5, child: Text('how many'))
              ],
            ),
          ],
        )),
      ),
    );
  }
}
