import 'package:flutter/material.dart';
import 'package:numfu/screen/cart.dart';
import 'package:numfu/screen/feedback.dart';
import 'package:numfu/utility/my_constant.dart';

class Ordering extends StatefulWidget {
  const Ordering({Key? key}) : super(key: key);

  @override
  State<Ordering> createState() => _OrderingState();
}

class _OrderingState extends State<Ordering> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '',
          style: MyCostant().headStyle(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  'Google Map',
                  style: TextStyle(
                    color: Color.fromARGB(255, 32, 32, 32),
                    fontSize: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: MyCostant.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 20,
            ),
          ],
        ),
        height: 320.0,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ListView(
              children: [
                Text(
                  'คุณจะได้รับอาหารภายใน 4 - 8 นาที',
                  style: MyCostant().h3Style(),
                ),
                Text(
                  'ข้าวมันไก่ ป้าเเต๋ว',
                  style: MyCostant().h3Style(),
                ),
                Text(
                  'Soi Thawon Phruek, Lat Krabang, Lat Krabang, Bang...',
                  style: MyCostant().h4Style(),
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 5, left: 0),
                        height: 80.0,
                        width: 80.0,
                        child: Center(
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: IconButton(
                              icon: new Icon(
                                Icons.hourglass_empty,
                                size: 30.0,
                              ),
                              color: Color(0xFF162A49),
                              onPressed: () {},
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        height: 80.0,
                        width: 80.0,
                        child: Center(
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: IconButton(
                              icon: new Icon(
                                Icons.cookie,
                                size: 30.0,
                              ),
                              color: Color(0xFF162A49),
                              onPressed: () {},
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        height: 80.0,
                        width: 80.0,
                        child: Center(
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: IconButton(
                              icon: new Icon(
                                Icons.drive_eta,
                                size: 30.0,
                              ),
                              color: Color(0xFF162A49),
                              onPressed: () {},
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        height: 80.0,
                        width: 80.0,
                        child: Center(
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: IconButton(
                              icon: new Icon(
                                Icons.check,
                                size: 30.0,
                              ),
                              color: Color(0xFF162A49),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return feedback();
                                }));
                              },
                            ),
                          ),
                        )),
                  ],
                ),
                buildDivider(),
                Row(
                  children: [
                    Text(
                      'Waiting',
                      style: MyCostant().h3_1Style(),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Cooking',
                      style: MyCostant().h3Style(),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Rider is coming',
                      style: MyCostant().h3Style(),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Successful',
                      style: MyCostant().h3Style(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffFF8126),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage("img/avatar1.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                '  Sumate Deput',
                                style: TextStyle(
                                    color: MyCostant.white, fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 255, 241, 41),
                                    size: 20.0,
                                  ),
                                  Text(
                                    '4.6 เรตติ้ง',
                                    style: TextStyle(
                                        color: MyCostant.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

Divider buildDivider() {
  return const Divider(
    height: 30,
    thickness: 5,
    indent: 20,
    endIndent: 30,
    color: Color(0xff4A4949),
  );
}
