import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numfu/screen/Favorite.dart';
import 'package:numfu/screen/carousel.dart';
import 'package:numfu/screen/location.dart';
import 'package:numfu/screen/login.dart';
import 'package:numfu/screen/profile.dart';
import 'package:numfu/screen/promotion.dart';
import 'package:numfu/screen/res.dart';
import 'package:numfu/screen/wallet.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Index extends StatefulWidget {
  static const routeName = '/';

  const Index({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

class _IndexState extends State<Index> {
  final user = FirebaseAuth.instance.currentUser!;
  var res1 = new Card(
    child: Column(children: <Widget>[
      Image.asset(
        'img/1.1.jpg',
        height: 150,
        width: 150,
      )
    ]),
  );
  var res2 = new Card(
    child: Column(children: <Widget>[
      Image.asset(
        'img/1.2.jpg',
        height: 150,
        width: 150,
      )
    ]),
  );
  var res3 = new Card(
    child: Column(children: <Widget>[
      Image.asset(
        'img/1.3.jpg',
        height: 150,
        width: 150,
      )
    ]),
  );
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Numfu Delivery",
            style: GoogleFonts.khand(textStyle: TextStyle(fontSize: 36)),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Favorite();
                  }));
                },
                icon: Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 255, 7, 40),
                ))
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Container(
              child: Column(
                children: [
                  buildAdress(),
                  buildFirstName(size),
                  Carousel(),
                  buildPro(),
                  Text('ลดสุดคุ้ม 60%'),
                  Text('ลดสูงสุด 60 บ. ใส่รหัส GGWP'),
                  buildRes(res1: res1, res2: res2, res3: res3),
                ],
              ),
            )),
      ),
    );
  }

  MaterialButton buildSignout() {
    return MaterialButton(
      onPressed: () {
        FirebaseAuth.instance.signOut();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Login();
        }));
      },
      color: Colors.deepPurple[200],
      child: Text('sign out'),
    );
  }

  MaterialButton buildPro() {
    return MaterialButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return promotion();
        }));
      },
      color: MyCostant.primary,
      child: Text('คูปองส่วนลดอาหาร                     ดู'),
    );
  }

  Row buildFirstName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.80,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyCostant().h4Style(),
              labelText: 'กินอะไรดี?',
              prefixIcon: Icon(Icons.search),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyCostant.dark, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyCostant.light, width: 2),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.1,
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.list),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyCostant.dark, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyCostant.light, width: 2),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }

  Container buildtitle() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Numfu Delivery",
            style: GoogleFonts.khand(textStyle: TextStyle(fontSize: 36)),
          ),
        ],
      ),
    );
  }
}

class buildRes extends StatelessWidget {
  const buildRes({
    Key? key,
    required this.res1,
    required this.res2,
    required this.res3,
  }) : super(key: key);

  final Card res1;
  final Card res2;
  final Card res3;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Res();
              }));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Row(
                children: <Widget>[res1, res2, res3],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class buildAdress extends StatelessWidget {
  const buildAdress({
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
          Icon(
            Icons.location_history,
            color: MyCostant.light,
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontFamily: 'MN'),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Location();
              }));
            },
            child: const Text(
              'กรุณาเลือกที่อยู่',
              style: TextStyle(fontSize: 16, color: Color(0xFF000000)),
            ),
          ),
        ],
      ),
    );
  }
}

class buildtitle2 extends StatelessWidget {
  const buildtitle2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Delivery",
            style: GoogleFonts.khand(textStyle: TextStyle(fontSize: 36)),
          ),
        ],
      ),
    );
  }
}
