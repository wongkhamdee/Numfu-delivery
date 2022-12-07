import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:numfu/screen/Launcher.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:numfu/widgets/show_title.dart';

class success extends StatefulWidget {
  const success({super.key});

  @override
  State<success> createState() => _successState();
}

class _successState extends State<success> {
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
          Container(
            margin: EdgeInsets.all(100),
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
            'เติมเงินสำเร็จ!',
            style: MyCostant().h2Style(),
          ),
          Text(
            '100 บาท',
            style: MyCostant().h2Style(),
          ),
          Text(
            'เงินของคุณถูกส่งเข้ากระเป๋าตัง',
            style: MyCostant().h4Style(),
          ),
          buildSuccess(size),
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
              title: 'สำเร็จ',
              textStyle: MyCostant().h5button(),
            ),
          ),
        ),
      ],
    );
  }
}
