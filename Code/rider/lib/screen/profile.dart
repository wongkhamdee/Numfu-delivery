import 'package:flutter/material.dart';
import 'package:rider/widgets/show_image.dart';
import '../utility/my_constant.dart';

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
        automaticallyImplyLeading: false,
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
      'วศพล เเสนเลิศ',
      style: MyCostant().h2Style(),
    );
  }

  MaterialButton buildSignout() {
    return MaterialButton(
      onPressed: () {},
      color: MyCostant.red,
      child: Text(
        '                    ออกจากระบบ                    ',
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
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  width: 2, color: Color.fromARGB(255, 102, 102, 102)),
            ),
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
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  width: 2, color: Color.fromARGB(255, 102, 102, 102)),
            ),
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
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  width: 2, color: Color.fromARGB(255, 102, 102, 102)),
            ),
            labelStyle: MyCostant().h4Style(),
            labelText: 'เบอร์โทรศัพท์',
            suffixIcon: Icon(Icons.person),
          ),
        ),
      ),
    ],
  );
}
