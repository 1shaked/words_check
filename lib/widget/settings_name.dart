import 'package:flutter/material.dart';

class SettingsName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red, //                   <--- border color
          width: 5.0,
        ),
      ),
      padding: EdgeInsets.all(16.0),
      child: Text('settings name'),
    );
  }
}
