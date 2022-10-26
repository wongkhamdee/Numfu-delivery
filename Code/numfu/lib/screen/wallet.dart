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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: GoogleFonts.khand(textStyle: TextStyle(fontSize: 36)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
          child: Column(
        children: <Widget>[buildMywallet(), Text('ระบุจำนวนเงิน (THB)')],
      )),
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
