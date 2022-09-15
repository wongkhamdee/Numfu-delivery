import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  static const routeName = '/';

  const Wallet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WalletState();
  }
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Wallet Screen'),
        ],
      )),
    );
  }
}
