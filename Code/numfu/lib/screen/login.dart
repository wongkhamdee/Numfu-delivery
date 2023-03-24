import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:numfu/model/user_model.dart';
import 'package:numfu/screen/register.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:numfu/utility/my_dialog.dart';
import 'package:numfu/widgets/show_image.dart';
import 'package:numfu/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _canSubmit = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _canSubmit =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BuildImages(size),
                  buildAppName(),
                  buildText(),
                  BuildUsers(size),
                  BuildPassword(size),
                  BuildLogin(size),
                  BuildCreateAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row BuildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 40),
          child: ShowTitle(
            title: 'คุณเป็นสมาชิกเเล้วหรือไม่?',
            textStyle: MyCostant().h3Style(),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Register();
            }));
          },
          child: Text(
            'สมัครสมาชิก',
            style: TextStyle(
              color: MyCostant.primary,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  Row BuildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          width: size * 0.9,
          height: 38,
          child: ElevatedButton(
            style: MyCostant().myButtonStyle(),
            onPressed: _canSubmit
                ? () {
                    String cust_email = emailController.text;
                    String password = passwordController.text;
                    checkAuthen(cust_email: cust_email, password: password);
                  }
                : null,
            child: Text(
              'เข้าสู่ระบบ',
              style: MyCostant().h5button(),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> checkAuthen({String? cust_email, String? password}) async {
    String apiCheckAuthen =
        '${MyCostant.domain}/api_numfu/getUserWhereUser.php?isAdd=true&cust_email=$cust_email';
    await Dio().get(apiCheckAuthen).then((value) async {
      if (value.toString() == 'null') {
        MyDialog().normalDialog(
            context, 'User False !!', 'ไม่มีข้อมูล $cust_email อยู่ในระบบ');
      } else {
        for (var item in json.decode(value.data)) {
          UserModel model = UserModel.fromMap(item);
          if (password == model.password) {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setString('cust_email', model.cust_email);
            Navigator.pushNamedAndRemoveUntil(
                context, MyCostant.routeluncher, (route) => false);
          } else {
            MyDialog().normalDialog(
                context, 'Password Fail !!', 'กรุณากรอกรหัสผ่านอักครั้ง');
          }
        }
      }
    });
  }

  Row BuildUsers(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          width: size * 0.9,
          child: TextFormField(
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกอีเมลของท่าน';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelStyle: MyCostant().h4Style(),
              labelText: 'อีเมล',
              hintText: "กรอกอีเมลของคุณ",
              suffixIcon: Icon(Icons.email),
              contentPadding: EdgeInsets.only(left: 20),
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

  Row BuildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.9,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกกรอกรหัสผ่านของท่าน';
              } else {
                return null;
              }
            },
            // controller: passwordController,
            controller: passwordController,
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
              contentPadding: EdgeInsets.only(left: 20),
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
          title: 'ยินดีต้อนรับ',
          textStyle: MyCostant().h2Style(),
        ),
        ShowTitle(
          title: 'กรุณากรอกบัญชีของคุณ',
          textStyle: MyCostant().h2Style(),
        ),
      ],
    );
  }

  Row BuildImages(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.5,
          child: ShowImage(path: MyCostant.logo),
        ),
      ],
    );
  }
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
