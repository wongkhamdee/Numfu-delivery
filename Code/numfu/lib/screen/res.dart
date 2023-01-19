import 'package:flutter/material.dart';
import 'package:numfu/screen/index.dart';
import 'package:numfu/screen/menu.dart';
import 'package:numfu/screen/promotion.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Res extends StatefulWidget {
  static const routeName = '/';

  const Res({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ResState();
  }
}

class _ResState extends State<Res> {
  var res1 = Card(
    child: Column(children: <Widget>[
      Image.asset(
        'img/menu1.jpg',
        height: 160,
        width: 160,
      ),
      const Text(
        'ข้าวมันไก่ต้ม',
        style: TextStyle(fontSize: 18),
      ),
      const Text('45 บาท', style: TextStyle(fontSize: 18)),
    ]),
  );
  var res2 = Card(
    child: Column(children: <Widget>[
      Image.asset(
        'img/menu2.jpg',
        height: 160,
        width: 160,
      ),
      const Text('ข้าวมันไก่ทอด', style: TextStyle(fontSize: 18)),
      const Text('45 บาท', style: TextStyle(fontSize: 18)),
    ]),
  );
  var res3 = Card(
    child: Column(children: <Widget>[
      Image.asset(
        'img/menu3.jpg',
        height: 160,
        width: 160,
      ),
      const Text('ข้าวมันไก่ย่าง', style: TextStyle(fontSize: 18)),
      const Text('45 บาท', style: TextStyle(fontSize: 18)),
    ]),
  );
  var res4 = Card(
    child: Column(children: <Widget>[
      Image.asset(
        'img/menu4.jpg',
        height: 160,
        width: 160,
      ),
      const Text('ก๋วยเตี๋ยวน้ำใส', style: TextStyle(fontSize: 18)),
      const Text('45 บาท', style: TextStyle(fontSize: 18)),
    ]),
  );
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Index();
                }));
              },
              icon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 95, 95, 95),
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Index();
                }));
              },
              icon: Icon(
                Icons.favorite,
                color: Color.fromARGB(255, 95, 95, 95),
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
          child: Column(
        children: [
          buildBanner(),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Container(
              child: Column(
                children: [
                  showSheet(),
                  buildPro(),
                ],
              ),
            ),
          ),
          buildCate(size: size),
          buildRes(res1: res1, res2: res2, res3: res3, res4: res4),

          /*Container(
            child: Row(
              children: <Widget>[res1, res2],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[res3, res2],
            ),
          ),*/
        ],
      )),
    );
  }

  MaterialButton buildPro() {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        side: BorderSide(
          color: Color.fromARGB(255, 5, 5, 5),
          width: 2.0,
        ),
      ),
      minWidth: 2,
      onPressed: () {},
      color: MyCostant.white,
      child: Row(
        children: [
          Icon(
            Icons.discount,
            color: MyCostant.primary,
            size: 20.0,
          ),
          Text(
            'ดูโปรโมชันที่สามารถใช้งานได้',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class buildBanner extends StatelessWidget {
  const buildBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'img/kaw.png',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 80),
          child: Text(
            'ข้าวมันไก่ ป้าแต๋ว',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 120),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: MyCostant.star,
                size: 20.0,
              ),
              Text(
                ' 0.8 กม. 10 นาที | 15บ.',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
            ],
          ),
        ),
      ],
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
    );
  }
}

class buildRes extends StatelessWidget {
  const buildRes({
    Key? key,
    required this.res1,
    required this.res2,
    required this.res3,
    required this.res4,
  }) : super(key: key);

  final Card res1;
  final Card res2;
  final Card res3;
  final Card res4;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 30),
        child: Container(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Menu();
                  }));
                },
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[res1, res2],
                    ),
                    Row(
                      children: <Widget>[res3, res4],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class buildCate extends StatelessWidget {
  const buildCate({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5, left: 30),
          width: size * 0.2,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: MyCostant.dark),
            borderRadius: BorderRadius.circular(10),
            color: MyCostant.primary,
          ),
          child: Center(
            child: Text(
              "ทั้งหมด",
              style: MyCostant().h6_1button(),
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: size * 0.2,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: MyCostant.dark),
            borderRadius: BorderRadius.circular(10),
            color: MyCostant.dark2,
          ),
          child: Center(
            child: Text(
              "ข้าวมันไก่",
              style: MyCostant().h6_2button(),
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: size * 0.2,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: MyCostant.dark),
            borderRadius: BorderRadius.circular(10),
            color: MyCostant.dark2,
          ),
          child: Center(
            child: Text(
              "ก๋วยเตี๋ยว",
              style: MyCostant().h6_2button(),
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: size * 0.2,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: MyCostant.dark),
            borderRadius: BorderRadius.circular(10),
            color: MyCostant.dark2,
          ),
          child: Center(
            child: Text(
              "น้ำ",
              style: MyCostant().h6_2button(),
            ),
          ),
        ),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  _State createState() => _State();
}

class _State extends State<HomePage> {
  int _selectedIndex = 0;
  final double _sheetSize = 0.4;
  _onItemTapped(index) {
    setState(() {
      DraggableScrollableActuator.reset(context);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          key: UniqueKey(),
          initialChildSize: _sheetSize,
          minChildSize: 0.0,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.blue[100],
              child: ListView.builder(
                controller: scrollController,
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'));
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class showSheet extends StatefulWidget {
  const showSheet({Key? key}) : super(key: key);

  @override
  State<showSheet> createState() => _showSheetState();
}

class _showSheetState extends State<showSheet> {
  void displayPersistentBottomSheet() {
    Scaffold.of(context).showBottomSheet<void>((BuildContext context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                Container(
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xffE7E7E7),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '  จัดส่งล่วงเวลา',
                        style: TextStyle(
                          color: MyCostant.primary,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
                Text(
                  '  รับที่ร้าน',
                  style: TextStyle(
                    color: MyCostant.dark80,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'วันนี้',
                      style: TextStyle(
                        color: MyCostant.primary,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '14',
                      style: TextStyle(
                        color: MyCostant.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      'พฤ.',
                      style: TextStyle(
                        color: MyCostant.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '15',
                      style: TextStyle(
                        color: MyCostant.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      'ศ.',
                      style: TextStyle(
                        color: MyCostant.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '16',
                      style: TextStyle(
                        color: MyCostant.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      'ส.',
                      style: TextStyle(
                        color: MyCostant.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '17',
                      style: TextStyle(
                        color: MyCostant.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'อ.',
                      style: TextStyle(
                        color: MyCostant.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '18',
                      style: TextStyle(
                        color: MyCostant.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'วันนี้ 13:30 - 14:00 น.',
                  style: TextStyle(
                    color: MyCostant.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'วันนี้ 14:30 - 15:00 น.',
                  style: TextStyle(
                    color: MyCostant.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'วันนี้ 15:30 - 16:00 น.',
                  style: TextStyle(
                    color: MyCostant.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'ทันที 40 นาที',
                  style: TextStyle(
                    color: MyCostant.black,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        side: BorderSide(
          color: Color.fromARGB(255, 5, 5, 5),
          width: 2.0,
        ),
      ),
      minWidth: 2,
      onPressed: displayPersistentBottomSheet,
      color: MyCostant.white,
      child: Row(
        children: [
          Icon(
            Icons.timelapse,
            color: MyCostant.primary,
            size: 20.0,
          ),
          Text(
            ' การจัดส่งล่วงเวลา',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
