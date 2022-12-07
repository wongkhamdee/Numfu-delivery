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
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: ListView(
            children: <Widget>[
              buildBox(),
              SizedBox(height: 10),
              BuildMenu(),
              buildEnter(size: size),
              SizedBox(height: 30),
              buildBox(),
              SizedBox(height: 10),
              buildBox(),
              SizedBox(height: 10),
              buildBox(),
            ],
          )),
    );
  }

  Column BuildMenu() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'สปาเก็ตตี้ผัดขี้เมา',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(width: 50),
            Text('120'),
          ],
        ),
        SizedBox(width: 50),
        Row(
          children: [
            Text(
              'สปาเก็ตตี้คาโบนาร่า',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(width: 50),
            Text('120'),
          ],
        ),
        Row(
          children: [
            Text(
              'สปาเก็ตตี้ไก่ย่างพริกไทยทำ',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(width: 50),
            Text('120'),
          ],
        ),
      ],
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

Container buildBox() {
  return Container(
    width: 350,
    height: 140,
    decoration: const BoxDecoration(
      color: Color(0xF3F3F3),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          // part picture
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("img/4.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),

          // part data
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Spaghetti Nania',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Text("17 ก.ย. 2565 - 10.30 น.'",
                      style: TextStyle(fontSize: 18)),
                  SizedBox(width: 8),
                ],
              ),
              Row(
                children: const [
                  SizedBox(width: 10),
                  Text("จัดส่งสำเร็จ", style: TextStyle(fontSize: 18)),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}
