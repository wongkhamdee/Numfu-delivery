import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numfu/screen/location.dart';
import 'package:numfu/screen/login.dart';
import 'package:numfu/screen/promotion.dart';
import 'package:numfu/screen/wallet.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:numfu/widgets/show_image.dart';

class Profile extends StatefulWidget {
  static const routeName = '/';

  const Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

final user = FirebaseAuth.instance.currentUser!;

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildImage(size),
          Text('แก้ไขข้อมูล'),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'ชื่อ',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'นามสกุล',
            ),
          ),
          Text('หมายเลขโทรศัพท์' + user.phoneNumber!),
          buildSignout(),
        ],
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
}

Row buildImage(double size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          margin: EdgeInsets.only(top: 20),
          height: size * 0.3,
          child: ShowImage(
            path: MyCostant.logo,
          )),
    ],
  );
}
