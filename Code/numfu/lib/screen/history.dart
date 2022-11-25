import 'package:flutter/material.dart';
import 'package:numfu/utility/my_constant.dart';

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
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ประวัติการสั่งซื้อ',
          style: MyCostant().headStyle(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildMywallet(),
          buildEnter(size: size),
          Text('สปาเก็ตตี้ผัดขี้เมา'),
          Text('สปาเก็ตตี้คาโบนาร่า'),
          Text('สปาเก็ตตี้ไก่ย่างพริกไทยทำ'),
        ],
      )),
    );
  }
}

class buildMywallet extends StatelessWidget {
  const buildMywallet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      color: MyCostant.dark,
      child: Column(
        children: <Widget>[
          /*Icon(
            Icons.location_history,
            color: MyCostant.light,
          ),*/
          Text(
            'Spaghetti Nania',
            style: TextStyle(
                fontSize: 35, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          Text('17 ก.ย. 2565 - 10.30 น.'),
          Text('จัดส่งสำเร็จ'),
        ],
      ),
    );
  }
}

class buildEnter extends StatelessWidget {
  const buildEnter({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size * 0.1),
      width: size * 0.9,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: MyCostant.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          "สั่งอีกครั้ง",
          style: MyCostant().h5button(),
        ),
      ),
    );
  }
}
