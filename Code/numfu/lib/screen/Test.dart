import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Awesome Overlay',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 0,
            ),
            buildHis(),
            const SizedBox(height: 0),
          ],
        ),
      ),
    );
  }

  Container buildHis() {
    return Container(
      width: 350,
      height: 100,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        border: Border(bottom: BorderSide(width: 1)),
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
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    image: const DecorationImage(
                      image: AssetImage("img/4.jpg"),
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
                  'ชำระค่าอาหาร   -120 บาท',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Text("ข้าวมันไก่ป้าแต๋ว เกกี 4",
                        style: TextStyle(fontSize: 18)),
                    Text("      21 สิงหา", style: TextStyle(fontSize: 18)),
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
