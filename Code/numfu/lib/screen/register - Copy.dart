import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:numfu/widgets/show_title.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:numfu/widgets/show_image.dart';
import 'package:numfu/utility/my_dialog.dart';
import 'package:numfu/widgets/show_progress.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool statusRedEye = true;

  Future<Null> processInsertMySQL() async {
    String cust_phone = phoneController.text;
    String cust_firstname = nameController.text;
    String cust_lastname = lastnameController.text;
    String cust_email = emailController.text;
    String password = passwordController.text;

    print('Process insert data success');
    String apiInsertUser =
        '${MyCostant.domain}/api_numfu/insertData.php?isAdd=true&cust_firstname=$cust_firstname&cust_lastname=$cust_lastname&cust_phone=$cust_phone&cust_email=$cust_email&password=$password';
    await Dio().get(apiInsertUser).then((value) {
      if (value.toString() == 'true') {
        Navigator.pushNamed(context, MyCostant.routelogin);
      } else {
        MyDialog()
            .normalDialog(context, 'Create User Fail !!', 'Please try again');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        actions: [
          //BuildCreate(),
          //BuildNextPage(size),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'สมัครสมาชิก',
          style: TextStyle(color: Colors.black, fontSize: 36),
        ),
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                BuildPhone(size),
                BuildName(size),
                BuildLastName(size),
                BuildEmail(size),
                BuildPassword(size),
                BuildNextPage(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row BuildNextPage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          width: size * 0.9,
          height: 38,
          child: ElevatedButton(
            style: MyCostant().myButtonStyle(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                return null;
              } else {
                processInsertMySQL();
              }
            },
            // onPressed: () {
            //   processInsertMySQL();
            // },
            child: Text(
              'สมัครสมาชิก',
              style: MyCostant().h5button(),
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
            controller: passwordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกกรอกรหัสผ่านของคุณ';
              } else {
                return null;
              }
            },
            maxLength: 255,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
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
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 19,
              ),
              hintStyle: TextStyle(
                fontSize: 16,
              ),
              labelText: 'รหัสผ่าน',
              hintText: 'กรุณากรอกรหัสผ่านของคุณ',
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

  Row BuildEmail(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.9,
          child: TextFormField(
            controller: emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกอีเมลของคุณ';
              } else {
                return null;
              }
            },
            maxLength: 255,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: MyCostant().h3Style(),
              labelText: 'อีเมล',
              hintText: 'กรุณากรอกอีเมลของคุณ',
              contentPadding: EdgeInsets.only(left: 20),
              suffixIcon: Icon(
                Icons.email_outlined,
              ),
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

  Row BuildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 60),
          width: size * 0.9,
          child: TextFormField(
            controller: phoneController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกเบอร์โทรศัพท์ของคุณ';
              } else {
                return null;
              }
            },
            maxLength: 10,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            // keyboardType: TextInputType.numberWithOptions(
            //   decimal: true,
            //   signed: true,
            // ),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: MyCostant().h3Style(),
              labelText: 'เบอร์โทรศัพท์',
              hintText: 'กรุณากรอกเบอร์โทรศัพท์ของคุณ',
              contentPadding: EdgeInsets.only(left: 20),
              suffixIcon: Icon(
                Icons.smartphone_outlined,
              ),
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

  Row BuildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.9,
          child: TextFormField(
            controller: nameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกชื่อจริงของคุณ';
              } else {
                return null;
              }
            },
            maxLength: 255,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: MyCostant().h3Style(),
              labelText: 'ชื่อ',
              hintText: 'กรุณากรอกชื่อจริงของคุณ',
              contentPadding: EdgeInsets.only(left: 20),
              suffixIcon: Icon(
                Icons.person_outline,
              ),
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

  Row BuildLastName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.9,
          child: TextFormField(
            controller: lastnameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกนามสกุลของคุณ';
              } else {
                return null;
              }
            },
            maxLength: 255,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: MyCostant().h3Style(),
              labelText: 'นามสกุล',
              hintText: 'กรุณากรอกนามสกุลของคุณ',
              contentPadding: EdgeInsets.only(left: 20),
              suffixIcon: Icon(
                Icons.person_outline,
              ),
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
}
