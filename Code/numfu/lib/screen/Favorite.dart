import 'package:flutter/material.dart';
import 'package:numfu/utility/my_constant.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  var res1 = new Card(
    child: Row(children: <Widget>[
      Image.asset(
        'img/1.1.jpg',
        height: 150,
        width: 150,
      ),
      Text('ข้าวมันไก่ต้ม')
    ]),
  );
  var res2 = new Card(
    child: Row(children: <Widget>[
      Image.asset(
        'img/1.2.jpg',
        height: 150,
        width: 150,
      ),
      Text('ข้าวมันไก่ทอด')
    ]),
  );
  var res3 = new Card(
    child: Column(children: <Widget>[
      Image.asset(
        'img/1.3.jpg',
        height: 150,
        width: 150,
      ),
      Text('ข้าวมันไก่ย่าง')
    ]),
  );
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'รายการโปรด',
          style: MyCostant().headStyle(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[res1],
            ),
          ),
          Text(
            'ข้าวมันไก่ ป้าแต๋ว - เกกี 4',
            style: MyCostant().h3Style(),
          ),
          Text('10 นาที 0.8 กม. '),
          Text('15 น. '),
          Text(
            'ก๋วยเตี๋ยว ประตูหลัง - บ้านอำเภอ',
            style: MyCostant().h3Style(),
          ),
          Text('10 นาที 0.8 กม. '),
          Text('15 น. '),
        ],
      )),
    );
  }
}
