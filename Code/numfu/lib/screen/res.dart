import 'package:flutter/material.dart';
import 'package:numfu/screen/index.dart';
import 'package:numfu/screen/promotion.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Res extends StatefulWidget {
  static const routeName = '/';

  const Res({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ResState();
  }
}

class _ResState extends State<Res> {
  var res1 = new Card(
    child: Column(children: <Widget>[
      Image.asset(
        'img/1.1.jpg',
        height: 150,
        width: 150,
      ),
      Text('ข้าวมันไก่ต้ม')
    ]),
  );
  var res2 = new Card(
    child: Column(children: <Widget>[
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Index();
                }));
              },
              icon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 95, 95, 95),
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Index();
                }));
              },
              icon: Icon(
                Icons.favorite,
                color: Color.fromARGB(255, 95, 95, 95),
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
          child: Column(
        children: [
          buildBanner(),
          buildPro(),
          //buildRes(res1: res1, res2: res2, res3: res3),
          Container(
            child: Row(
              children: <Widget>[res1, res2],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[res3, res2],
            ),
          ),
        ],
      )),
    );
  }
}

class buildBanner extends StatelessWidget {
  const buildBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'img/1.jpg',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Container(
            alignment: Alignment.center,
            child: Text(
              'ข้าวมันไก่ ป้าแต๋ว',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0),
            )),
      ],
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
      color: MyCostant.primary,
    );
  }
}

class buildRes extends StatelessWidget {
  const buildRes({
    Key? key,
    required this.res1,
    required this.res2,
    required this.res3,
  }) : super(key: key);

  final Card res1;
  final Card res2;
  final Card res3;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Res();
              }));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Row(
                children: <Widget>[res1, Text('as')],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

MaterialButton buildPro() {
  return MaterialButton(
    onPressed: () {},
    color: MyCostant.primary,
    child: Text('คูปองส่วนลดอาหาร                     ดู'),
  );
}
