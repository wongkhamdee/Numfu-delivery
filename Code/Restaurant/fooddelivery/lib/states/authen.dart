import 'package:flutter/material.dart';
import 'package:fooddelivery/utility/my_constant.dart';
import 'package:fooddelivery/widgets/show_images.dart';
import 'package:fooddelivery/widgets/show_titles.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool statusRedEye = true;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: ListView(
            children: [
              BuildImages(size),
              BuildAppName(),
              BuildWelcome(),
              BuildPlease(),
              BuildUsers(size),
              BuildPassword(size),
              BuildLogin(size),
              BuildCreateAccount(),
            ],
          ),
        ),
      ),
    );
  }

  Row BuildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitles(
          title: 'คุณเป็นสมา5656565ชิกเเล้วหรือไม่?',
          textStyle: MyConstant().h3Style(),
        ),
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, MyConstant.routeCreateAccount),
          child: Text('สมัครสมาชิก'),
        ),
      ],
    );
  }

  Row BuildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: size * 0.9,
          height: 48,
          child: ElevatedButton(
            style: MyConstant().myButtonStyle(),
            onPressed: () {},
            child: Text(
              'เข้าสู่ระบบ',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }

  Row BuildUsers(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.9,
          child: TextFormField(
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: TextStyle(color: Colors.black),
              labelText: 'อีเมล',
              hintText: 'กรุณากรอกอีเมลของคุณ',
              contentPadding: EdgeInsets.only(left: 20),
              suffixIcon: Icon(
                Icons.mail_outline,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row BuildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 25),
          width: size * 0.9,
          child: TextFormField(
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
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.black,
                      ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: TextStyle(color: Colors.black),
              labelText: 'รหัสผ่าน',
              hintText: 'กรุณากรอกรหัสผ่านของคุณ',
              contentPadding: EdgeInsets.only(left: 20),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row BuildWelcome() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 40),
            child: ShowTitles(
                title: 'ยินดีต้อนรับ', textStyle: MyConstant().h4Style())),
      ],
    );
  }

  Row BuildPlease() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          child: ShowTitles(
              title: 'กรุณาเข้าสู่ระบบของท่าน',
              textStyle: MyConstant().h5Style()),
        ),
      ],
    );
  }

  Row BuildAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: ShowTitles(
            title: MyConstant.appName,
            textStyle: MyConstant().h1Style(),
          ),
        ),
      ],
    );
  }

  Row BuildImages(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.3,
          child: ShowImages(path: MyConstant.logo),
        ),
      ],
    );
  }
}
