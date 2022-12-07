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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 0,
            ),
            buildBox(),
            buildBox(),
            buildBox(),
            const SizedBox(height: 0),
          ],
        ),
      ),
    );
  }

  Container buildBox() {
    return Container(
      width: 350,
      height: 175,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            // part picture
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

            // part data
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // name
                const Text(
                  'ข้าวมันไก่ป้าแต๋ว',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                // email
                Row(
                  children: const [
                    Text("10 นาที 0.8 กม. ", style: TextStyle(fontSize: 18)),
                    Icon(Icons.star),
                    SizedBox(width: 8),
                    Text("4.6", style: TextStyle(fontSize: 18)),
                  ],
                ),

                // phone
                Row(
                  children: const [
                    Icon(Icons.delivery_dining),
                    SizedBox(width: 10),
                    Text("15 นาที", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
