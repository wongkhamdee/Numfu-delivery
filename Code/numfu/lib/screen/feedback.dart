import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:numfu/screen/Launcher.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:numfu/widgets/show_title.dart';

class feedback extends StatefulWidget {
  const feedback({super.key});

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text(
            'ข้อเสนอแนะ',
            style: MyCostant().h1Style(),
          ),
          Container(
            margin: EdgeInsets.all(50),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              border: Border.all(
                width: 8,
                color: Color(0xff00D636),
              ),
            ),
            child: Icon(
              Icons.done,
              color: Color(0xff00D636),
              size: 100.0,
            ),
          ),
          Text(
            'จัดส่งออเดอร์สำเร็จ',
            style: MyCostant().h2Style(),
          ),
          Text(
            'กรุณาให้คะแนนความพึงพอใจ',
            style: MyCostant().h44Style(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color(0xff525252),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 6, //or null
                    decoration: InputDecoration.collapsed(
                        hintText: "ใส่ข้อเสนอแนะของคุณ"),
                  ),
                )),
          ),
          buildSuccess(size),
          Text(
            'หากไม่สนใจกด Skip',
            style: MyCostant().h4Style(),
          ),
        ],
      ),
    );
  }

  Row buildSuccess(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.9,
          child: ElevatedButton(
            style: MyCostant().myButtonStyle(),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Launcher();
              }));
            },
            child: ShowTitle(
              title: 'ส่งข้อเสนอแนะ',
              textStyle: MyCostant().h5button(),
            ),
          ),
        ),
      ],
    );
  }
}
