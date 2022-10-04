import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:numfu/screen/OTP.dart';
import 'package:numfu/screen/profile.dart';
import 'package:numfu/screen/proreg.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:numfu/widgets/show_title.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  Proreg profile = Proreg(email: '', password: '');

  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  bool statusRedEye = true;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Error'),
            ),
            body: Center(
              child: Text('${snapshot.error}'),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(
                    Icons.navigate_before,
                    size: 38,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              behavior: HitTestBehavior.opaque,
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    buildTextreg('สมัครสมาชิก'),
                    buildEmail(size),
                    buildPassword(size),
                    buildFirstName(size),
                    buildLastName(size),
                    buildLogin(context),
                    buildNext(size),
                  ],
                ),
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Container buildTextreg(String title) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: ShowTitle(
        title: title,
        textStyle: MyCostant().h1tStyle(),
      ),
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
            onSaved: (String? email) {
              profile.email = email!;
            },
            keyboardType: TextInputType.emailAddress,
            validator: MultiValidator([
              RequiredValidator(errorText: 'กรุณากรอกอีเมลของคุณ'),
              EmailValidator(errorText: 'รูปแบบอีเมลของคุณไม่ถูกต้อง'),
            ]),
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
          margin: EdgeInsets.only(top: 20),
          width: size * 0.9,
          child: TextFormField(
            validator: MultiValidator([
              RequiredValidator(errorText: 'กรุณากรอกรหัสผ่านของคุณ'),
              MinLengthValidator(6,
                  errorText: 'รหัสผ่านอย่างน้อยต้องมี 6 ตัวอักษร'),
            ]),
            onSaved: (String? password) {
              profile.password = password!;
            },
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

  Row buildFirstName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.9,
          child: TextFormField(
            validator: RequiredValidator(errorText: 'กรุณากรอกชื่อของคุณ'),
            decoration: InputDecoration(
              labelStyle: MyCostant().h4Style(),
              labelText: 'ชื่อจริง',
              hintText: "กรอกชื่อของคุณ",
              suffixIcon: Icon(Icons.person),
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

  Row buildLastName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.9,
          child: TextFormField(
            validator: RequiredValidator(errorText: 'กรุณากรอกนามสกุลของคุณ'),
            decoration: InputDecoration(
              labelStyle: MyCostant().h4Style(),
              labelText: 'นามสกุล',
              hintText: "กรอกนามสกุลของคุณ",
              suffixIcon: Icon(Icons.person),
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

  Container buildLogin(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ShowTitle(
            title: 'มีบัญชีอยู่แล้ว ?',
            textStyle: MyCostant().h4Style(),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, MyCostant.routelogin),
            child: Text('เข้าสู่ระบบ'),
          ),
        ],
      ),
    );
  }

  Row buildNext(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.9,
          child: ElevatedButton(
            style: MyCostant().myButtonStyle(),
            onPressed: () {
              if (formKey.currentState!.validate() == false) {
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Otp();
                }));
              }
            },
            /* onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: profile.email, password: profile.password);
                  Fluttertoast.showToast(
                      msg: "สร้างบัญชีผู้ใช้เรียบร้อยแล้ว",
                      gravity: ToastGravity.TOP);
                  formKey.currentState!.reset();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Otp();
                  }));
                } on FirebaseAuthException catch (e) {
                  //print(e.message);
                  Fluttertoast.showToast(
                      msg: e.message!, gravity: ToastGravity.CENTER);
                }
              }
              //if (formKey.currentState!.validate()) {}
              /*if (formKey.currentState!.validate() == false) {
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Otp();
                }));
              }*/
            },*/
            child: ShowTitle(
              title: 'ต่อไป',
              textStyle: MyCostant().h5button(),
            ),
          ),
        ),
      ],
    );
  }
}
