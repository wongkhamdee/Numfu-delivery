import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numful/screen/forgetpass.dart';
import 'package:numful/utility/my_constant.dart';

class Index extends StatefulWidget {
  static const routeName = '/';

  const Index({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: SingleChildScrollView(
              //ป้องกันตอนย้อนกลับมาปุ่ม overflow
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Numfu",
                          style: GoogleFonts.khand(
                              textStyle: TextStyle(fontSize: 36)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Delivery",
                          style: GoogleFonts.khand(
                              textStyle: TextStyle(fontSize: 36)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_history,
                          color: MyCostant.light,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontFamily: 'MN'),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Forgetpass();
                            }));
                          },
                          child: const Text(
                            'กรุณาเลือกที่อยู่',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF000000)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}