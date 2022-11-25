import 'package:flutter/material.dart';
import 'package:numfu/screen/login.dart';
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

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ข้อมูลส่วนตัว',
          style: MyCostant().headStyle(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildImage(size),
          buildTextname(),
          buildedit(),
          buildFirstName(size),
          buildLastName(size),
          buildphone(size),
          buildSignout(),
        ],
      )),
    );
  }

  Container buildedit() {
    return Container(
        margin: EdgeInsets.only(right: 290),
        child: Text(
          'แก้ไขข้อมูล',
          style: MyCostant().h3Style(),
        ));
  }

  Text buildTextname() {
    return Text(
      'ชญานิญ สัตติวงษ์',
      style: MyCostant().h2Style(),
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
      color: MyCostant.red,
      child: Text(
        'ออกจากระบบ',
        style: MyCostant().h5button(),
      ),
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

Row buildFirstName(double size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: 20),
        width: size * 0.9,
        child: TextFormField(
          decoration: InputDecoration(
            labelStyle: MyCostant().h4Style(),
            labelText: 'ชื่อจริง',
            hintText: "กรอกชื่อของคุณ",
            suffixIcon: Icon(Icons.person),
          ),
        ),
      ),
    ],
  );
}

Row buildLastName(double size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: 20),
        width: size * 0.9,
        child: TextFormField(
          decoration: InputDecoration(
            labelStyle: MyCostant().h4Style(),
            labelText: 'นามสกุล',
            hintText: "กรอกนามสกุลของคุณ",
            suffixIcon: Icon(Icons.person),
          ),
        ),
      ),
    ],
  );
}

Row buildphone(double size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: 20),
        width: size * 0.9,
        child: TextFormField(
          decoration: InputDecoration(
            labelStyle: MyCostant().h4Style(),
            labelText: 'เบอร์โทรศัพท์',
            suffixIcon: Icon(Icons.person),
          ),
        ),
      ),
    ],
  );
}
