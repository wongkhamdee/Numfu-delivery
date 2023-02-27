import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numfu/screen/Favorite.dart';
import 'package:numfu/screen/carousel.dart';
import 'package:numfu/screen/location.dart';
import 'package:numfu/screen/login.dart';
import 'package:numfu/screen/profile.dart';
import 'package:numfu/screen/promotion.dart';
import 'package:numfu/screen/res.dart';
import 'package:numfu/screen/select_address.dart';
import 'package:numfu/screen/wallet.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState() {
    super.initState();
    readApiShop();
  }

  Future<Null> readApiShop() async {
    String apiGetproductWhereIDBuyyer =
        '${MyCostant.domain}/api_numfu/getProductWhereIdSeller.php';
    await Dio().get(apiGetproductWhereIDBuyyer).then((value) {
      // print('value ==> $value');
      var result = json.decode(value.data);
      // print('result = $result');
      for (var item in result) {
        print('item ==> $item');
        // UserModel model = UserModel.fromMap(item);
        // print('name ==> ${model.name}');
      }
    });
  }

  /*final user = FirebaseAuth.instance.currentUser!;*/
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
          automaticallyImplyLeading: false,
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
              child: ListView(
                children: [
                  buildAdress(),
                  buildFirstName(size),
                  SizedBox(
                    height: 20,
                  ),
                  Carousel(),
                  buildPro(),
                  Text(
                    'ลดสุดคุ้ม 60%',
                    style: MyCostant().h2Style(),
                  ),
                  Text(
                    'ลดสูงสุด 60 บ. ใส่รหัส GGWP',
                    style: MyCostant().h3Style(),
                  ),
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
      color: MyCostant.light,
      child: Text(
        'คูปองส่วนลดอาหาร                                 ดู',
        style: MyCostant().h7button(),
      ),
    );
  }

  Row buildFirstName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.82,
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
        SizedBox(
          width: 10,
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
          Container(
            margin: const EdgeInsets.all(10.0),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              image: const DecorationImage(
                image: AssetImage("img/delivery.png"),
                fit: BoxFit.cover,
              ),
            ),
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
              style: TextStyle(
                  fontSize: 24, color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          Icon(
            Icons.edit,
            color: Colors.white,
            size: 20.0,
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
