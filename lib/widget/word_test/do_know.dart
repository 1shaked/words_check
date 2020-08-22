import 'package:flutter/material.dart';

class DoYouKnow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              color: Colors.black,
              child: RaisedButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.cancel, color: Colors.white),
                  label: Text("did'nt know",
                      style: TextStyle(color: Colors.white))),
            )),
            Expanded(
                child: Container(
              color: Colors.green,
              child: RaisedButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.check_circle, color: Colors.white),
                  label: Text("did know!",
                      style: TextStyle(
                        color: Colors.white,
                      ))),
            )),
          ],
        ),
      ),
    );
  }
}
