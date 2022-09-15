import 'package:flutter/material.dart';

class index extends StatefulWidget {
  static const routeName = '/';

  const index({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _indexState();
  }
}

class _indexState extends State<index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Home Screen'),
        ],
      )),
    );
  }
}
