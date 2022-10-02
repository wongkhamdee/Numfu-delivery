import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numful/screen/location.dart';
import 'package:numful/screen/select_address.dart';
import 'package:numful/utility/my_constant.dart';
import 'package:numful/widgets/show_title.dart';

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
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildtitle(),
                  buildtitle2(),
                  buildAdress(),
                  buildFirstName(size),
                ],
              ),
            )));
  }

  Row buildFirstName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.7,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyCostant().h4Style(),
              labelText: 'กินอะไรดี?',
              prefixIcon: Icon(Icons.search),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyCostant.dark, width: 2),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyCostant.light, width: 2),
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.1,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Index();
              }));
            },
            icon: Icon(Icons.category_rounded),
            label: Text(""),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.1,
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.favorite),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyCostant.dark, width: 2),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyCostant.light, width: 2),
                  borderRadius: BorderRadius.circular(30)),
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
            "Numfu",
            style: GoogleFonts.khand(textStyle: TextStyle(fontSize: 36)),
          ),
        ],
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
                return Select_a();
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
