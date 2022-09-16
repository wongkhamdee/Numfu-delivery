import 'package:flutter/material.dart';
import 'package:numful/screen/Launcher.dart';
import 'package:numful/screen/forgetpass.dart';
import 'package:numful/screen/register.dart';
import 'package:numful/utility/my_constant.dart';
import 'package:numful/widgets/show_image.dart';
import 'package:numful/widgets/show_title.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool statusRedEye = true;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    //ประกาศ size ให้ปรับขนาด auto ตามขนาดหน้าจอ
    return Scaffold(
        body: SafeArea(
      //padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),

      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: ListView(
          children: [
            buildImage(size),
            buildAppName(),
            buildText(),
            buildEmail(size),
            buildPassword(size),
            //buildRememb(context),
            buildRemember(),
            buildLogin(size),
            buildOR(),
            buildRegister(size),
          ],
        ),
      ),
    ));
  }

  Container buildRemember() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                  fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.orange.withOpacity(.32);
                    }
                    return Colors.orange;
                  }),
                  value: isChecked,
                  onChanged: (value) {
                    isChecked = !isChecked;
                    setState(() {});
                  }),
              Text("จดจำรหัสผ่าน", style: TextStyle(color: MyCostant.dark)),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'ลืมรหัสผ่าน?',
              style: TextStyle(color: MyCostant.dark),
            ),
          )
        ],
      ),
    );
  }

  Container buildRememb(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: null,
              onChanged: null,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontFamily: 'MN'),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Forgetpass();
                }));
              },
              child: const Text(
                'ลืมรหัสผ่าน?',
                style: TextStyle(color: Color(0xFF757575)),
              ),
            ),
          ],
        ));
  }

  Container buildOR() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("หรือ", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Row buildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.9,
          child: ElevatedButton(
            style: MyCostant().myButtonStyle(),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Launcher();
              }));
            },
            child: ShowTitle(
              title: 'เข้าสู่ระบบ',
              textStyle: MyCostant().h5button(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildRegister(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          width: size * 0.9,
          child: ElevatedButton(
            style: MyCostant().myButtonStyle(),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Register();
              }));
            },
            child: ShowTitle(
              title: 'สมัครสมาชิก',
              textStyle: MyCostant().h5button(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildEmail(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          width: size * 0.9,
          child: TextFormField(
            controller: email,
            decoration: InputDecoration(
              labelStyle: MyCostant().h4Style(),
              labelText: 'อีเมล',
              hintText: "กรอกอีเมลของคุณ",
              suffixIcon: Icon(Icons.email),
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

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: size * 0.9,
          child: TextFormField(
            controller: password,
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    statusRedEye = !statusRedEye;
                  });
                },
                icon: statusRedEye
                    ? Icon(
                        Icons.remove_red_eye,
                      )
                    : Icon(
                        Icons.remove_red_eye_outlined,
                      ),
              ),
              labelStyle: MyCostant().h4Style(),
              labelText: 'รหัสผ่าน',
              hintText: "กรอกรหัสผ่านของคุณ",
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

  Column buildText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
        ),
        ShowTitle(
          title: "ยินดีต้อนรับ",
          textStyle: MyCostant().h2Style(),
        ),
        ShowTitle(
          title: "ลงชื่อเข้าบัญชีของคุณ",
          textStyle: MyCostant().h2Style(),
        ),
      ],
    );
  }

  Row buildAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: MyCostant.appName,
          textStyle: MyCostant().h1Style(),
        ),
      ],
    );
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
}
