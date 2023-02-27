import 'package:flutter/material.dart';
import 'package:rider/screen/accept_order1.dart';
import '../utility/my_constant.dart';

class Mywork extends StatefulWidget {
  const Mywork({super.key});

  @override
  State<Mywork> createState() => _MyworkState();
}

class _MyworkState extends State<Mywork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Center(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('รายได้วันนี้'),
                        Text('0 บาท'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('เครดิตรับงาน'),
                        Text('0 บาท'),
                      ],
                    ),
                    TextButton(
                        child: const Text(' งดรับงาน ',
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 25,
                            )),
                        onPressed: () {/* ... */},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xffFF3326)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(
                                        color: Color(0xffFF3326)))))),
                  ],
                ),
                buildWork(),
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
            title: Text('ร้านชาพะยอม'),
            subtitle: Text('ซันไซน์ อพาร์ทเม้นท์'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                    child: const Text('รับงานนี้',
                        style: TextStyle(color: Color(0xffffffff))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ACPT_order1();
                      }));
                    },
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
          ListTile(
            leading: Icon(Icons.more_vert),
            title: Text('กอล์ฟ'),
            subtitle: Text('as'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                    child: const Text('ปฎิเสธงานนี้',
                        style: TextStyle(color: Color(0xffffffff))),
                    onPressed: () {/* ... */},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffFF3326)),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Color(0xffFF3326)))))),
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
