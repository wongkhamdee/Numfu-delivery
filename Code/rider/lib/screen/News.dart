import 'package:flutter/material.dart';
import '../utility/my_constant.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ข่าวประกาศ',
          style: MyCostant().headStyle(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: [
            buildHis2(),
            buildDivider(),
            buildHis2(),
            buildDivider(),
            buildHis2(),
            buildDivider(),
            buildHis2(),
            buildDivider(),
            buildHis2(),
            buildDivider(),
            buildHis2(),
            buildDivider(),
          ],
        ),
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

Divider buildDivider() {
  return const Divider(
    height: 35,
    color: Color(0xff4A4949),
  );
}
