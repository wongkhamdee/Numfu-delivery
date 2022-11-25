import 'package:flutter/material.dart';
import 'package:numfu/utility/my_constant.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'กระเป๋าเงิน',
          style: MyCostant().headStyle(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Text(
            'ระบุจำนวนเงิน (THB)',
            style: MyCostant().h3Style(),
          ),
          Text(
            'ประวัติล่าสุด',
            style: MyCostant().h3Style(),
          ),
        ],
      )),
    );
  }
}
