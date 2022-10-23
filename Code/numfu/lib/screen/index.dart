import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numfu/screen/location.dart';
import 'package:numfu/screen/login.dart';
import 'package:numfu/screen/promotion.dart';
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
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: Container(
            child: Column(
              children: [
                buildtitle(),
                //buildtitle2(),
                buildAdress(),
                buildFirstName(size),
                buildSignout(),
                buildPro(),
                Text('signed in as: ' + user.phoneNumber!),
              ],
            ),
          )),
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
      color: Colors.deepPurple[200],
      child: Text('promotion'),
    );
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
            "Numfu Delivery",
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
