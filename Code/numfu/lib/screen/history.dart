import 'package:flutter/material.dart';

class History extends StatefulWidget {
  static const routeName = '/';

  const History({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HistoryState();
  }
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Profile Screen'),
        ],
      )),
    );
  }
}
