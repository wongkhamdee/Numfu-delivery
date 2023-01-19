import 'package:flutter/material.dart';
import '../utility/my_constant.dart';

class Mywallet extends StatefulWidget {
  const Mywallet({super.key});

  @override
  State<Mywallet> createState() => _MywalletState();
}

class _MywalletState extends State<Mywallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'กระเป๋าเงิน',
          style: MyCostant().headStyle(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Center(
            child: ListView(
              children: [
                buildWork(),
              ],
            ),
          )),
    );
  }

  Card buildWork() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album),
            title: Text(
              'วศพล เเสนเลิศ',
              style: MyCostant().h3Style(),
            ),
            subtitle: Text(
              '56.07 บาท',
              style: MyCostant().h2_1Style(),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                    child: const Text('บัญชีธนาคาร >',
                        style: TextStyle(color: Color(0xffffffff))),
                    onPressed: () {/* ... */},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffFF8126)),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Color(0xffFF8126)))))),
              ],
            ),
          ),
        ],
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
            ' ยอดเงินคงเหลือ',
            style: TextStyle(
                fontSize: 35, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          Text(
            '     200 บาท',
            style: TextStyle(
                fontSize: 35, color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ],
      ),
    );
  }
}