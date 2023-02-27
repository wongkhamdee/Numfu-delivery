import 'package:flutter/material.dart';
import 'package:numfu/utility/my_constant.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: [
            buildBox1(),
            buildDivider(),
            buildBox2(),
            buildDivider(),
          ],
        ),
      ),
    );
  }

  Container buildBox1() {
    return Container(
      width: 350,
      height: 120,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage("img/1.1.jpg"),
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
                  'ข้าวมันไก่ป้าแต๋ว',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Text("10 นาที 0.8 กม. ", style: TextStyle(fontSize: 18)),
                    Icon(Icons.star),
                    SizedBox(width: 8),
                    Text("4.6", style: TextStyle(fontSize: 18)),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.delivery_dining),
                    SizedBox(width: 10),
                    Text("10 บาท", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildBox2() {
    return Container(
      width: 350,
      height: 120,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage("img/1.2.jpg"),
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
                  'ก๋วยเตี๋ยวประตูหลัง',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Text("18 นาที 1.2 กม. ", style: TextStyle(fontSize: 18)),
                    Icon(Icons.star),
                    SizedBox(width: 8),
                    Text("4.8", style: TextStyle(fontSize: 18)),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.delivery_dining),
                    SizedBox(width: 10),
                    Text("15 บาท", style: TextStyle(fontSize: 18)),
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
      height: 40,
      thickness: 3,
      indent: 10,
      endIndent: 30,
      color: Color.fromARGB(255, 224, 224, 224),
    );
  }
}
