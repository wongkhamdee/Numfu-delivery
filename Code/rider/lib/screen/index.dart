import 'package:flutter/material.dart';
import 'package:rider/screen/Launcher.dart';
import 'package:rider/screen/Mywallet.dart';
import 'package:rider/screen/Mywork.dart';
import 'package:rider/screen/News.dart';
import 'package:rider/screen/profile.dart';

import '../utility/my_constant.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Container(
            child: ListView(
              children: [
                buildHello(),
                buildSum(),
                buildNews(),
                buildHis2(),
                buildDivider(),
                buildHis2(),
                buildDivider(),
                buildHis2(),
                buildDivider(),
                buildHis2(),
                buildDivider(),
                buildNext(context, size),
              ],
            ),
          )),
    );
  }

  Row buildNews() {
    return Row(
      children: [
        Text(
          'ข่าวประกาศ',
          style: MyCostant().h2Style(),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Color.fromARGB(255, 0, 0, 0),
            padding: const EdgeInsets.all(16.0),
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return News();
            }));
          },
          child: Text(
            'ดูทั้งหมด',
            style: MyCostant().h3_1Style(),
          ),
        ),
      ],
    );
  }

  Row buildSum() {
    return Row(
      children: [
        Icon(
          Icons.discount,
          color: MyCostant.primary,
          size: 20.0,
        ),
        Text(
          'รายได้วันนี้',
          style: MyCostant().h3Style(),
        ),
        Icon(
          Icons.wallet,
          color: MyCostant.primary,
          size: 20.0,
        ),
        Text(
          'เครดิตรับงาน',
          style: MyCostant().h3Style(),
        ),
      ],
    );
  }
}

class buildHello extends StatelessWidget {
  const buildHello({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      color: MyCostant.white,
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10.0),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              image: const DecorationImage(
                image: AssetImage("img/avatar1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'สวัสดี!',
                style: MyCostant().h3Style(),
              ),
              Text(
                'วศพล แสนเลิศ',
                style: MyCostant().h2Style(),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xffFFC077),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    Text(
                      ' Member ',
                      style: TextStyle(fontSize: 18, color: MyCostant.white),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Container buildHis2() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          // part picture
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  image: const DecorationImage(
                    image: AssetImage("img/Vector.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'สุดคุ้ม! สะสมรอบขับรับโบนัสเพิ่ม (6 ต.ค.)',
                style: TextStyle(fontSize: 18, color: Color(0xff000000)),
              ),
              Row(
                children: const [
                  Text("รับโบนัสทันทีสูงสุด 20บ.",
                      style: TextStyle(fontSize: 18)),
                  Text(
                    "           >",
                    style: TextStyle(fontSize: 18, color: Color(0xff525252)),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}

GestureDetector buildNext(BuildContext context, double size) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Launcher();
      }));
    },
    child: Container(
      margin: EdgeInsets.only(top: 50),
      width: size * 0.9,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
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
          "พร้อมเริ่มงาน",
          style: MyCostant().h5button(),
        ),
      ),
    ),
  );
}

Divider buildDivider() {
  return const Divider(
    height: 35,
    color: Color(0xff4A4949),
  );
}
