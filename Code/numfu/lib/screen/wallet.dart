import 'package:flutter/material.dart';
import 'package:numfu/screen/index.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Wallet extends StatefulWidget {
  static const routeName = '/';

  const Wallet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WalletState();
  }
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'กระเป๋าเงิน',
          style: MyCostant().headStyle(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          buildMywallet(),
          Text(
            'ระบุจำนวนเงิน (THB)',
            style: MyCostant().h3Style(),
          ),
          buildTopup(size),
          numtop(size: size),
          buildEnter(size: size),
          Text(
            'ประวัติล่าสุด',
            style: MyCostant().h3Style(),
          ),
        ],
      )),
    );
  }
}

class numtop extends StatelessWidget {
  const numtop({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: size * 0.1),
          width: size * 0.2,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: MyCostant.dark),
            borderRadius: BorderRadius.circular(20),
            color: MyCostant.white,
          ),
          child: Center(
            child: Text(
              "+100",
              style: MyCostant().h6button(),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: size * 0.1),
          width: size * 0.2,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: MyCostant.dark),
            borderRadius: BorderRadius.circular(20),
            color: MyCostant.white,
          ),
          child: Center(
            child: Text(
              "+200",
              style: MyCostant().h6button(),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: size * 0.1),
          width: size * 0.2,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: MyCostant.dark),
            borderRadius: BorderRadius.circular(20),
            color: MyCostant.white,
          ),
          child: Center(
            child: Text(
              "+500",
              style: MyCostant().h6button(),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: size * 0.1),
          width: size * 0.2,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: MyCostant.dark),
            borderRadius: BorderRadius.circular(20),
            color: MyCostant.white,
          ),
          child: Center(
            child: Text(
              "+1,000",
              style: MyCostant().h6button(),
            ),
          ),
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
          "ยืนยัน",
          style: MyCostant().h5button(),
        ),
      ),
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
      child: Row(
        children: <Widget>[
          /*Icon(
            Icons.location_history,
            color: MyCostant.light,
          ),*/
          Text(
            'ยอดเงินคงเหลือ',
            style: TextStyle(
                fontSize: 35, color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ],
      ),
    );
  }
}

Row buildTopup(double size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: 20),
        width: size * 0.9,
        child: TextFormField(
          decoration: InputDecoration(
            labelStyle: MyCostant().h4Style(),
            labelText: 'ใส่จำนวนเงิน',
            hintText: "ใส่จำนวนเงินที่ต้องการเติม..",
            //suffixIcon: Icon(Icons.person),
          ),
        ),
      ),
    ],
  );
}
