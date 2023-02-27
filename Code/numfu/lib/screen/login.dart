import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:numfu/screen/Launcher.dart';
import 'package:numfu/screen/OTP.dart';
import 'package:numfu/screen/index.dart';

import 'package:numfu/utility/my_constant.dart';
import 'package:numfu/widgets/show_image.dart';
import 'package:numfu/widgets/show_title.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void dispose() {
    phoneController.dispose();

    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  bool isChecked = false;

  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  bool statusRedEye = true;
  bool isButtonActive = false;

  //TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  double bottom = 0;

  String otpPin = " ";
  String countryDial = "+66";
  String verID = " ";

  int screenState = 0;

  Future<void> verifyPhone(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 20),
      verificationCompleted: (PhoneAuthCredential credential) {
        showSnackBarText("ยืนยันสำเร็จ!");
      },
      verificationFailed: (FirebaseAuthException e) {
        showSnackBarText("ยืนยันล้มเหลว!");
      },
      codeSent: (String verificationId, int? resendToken) {
        showSnackBarText("กำลังส่ง OTP!");
        verID = verificationId;
        setState(() {
          screenState = 1;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        showSnackBarText("หมดเวลา!");
      },
    );
  }

  Future<void> verifyOTP() async {
    await FirebaseAuth.instance
        .signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verID,
        smsCode: otpPin,
      ),
    )
        .whenComplete(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Launcher(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottom = MediaQuery.of(context).viewInsets.bottom;
    double size = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: WillPopScope(
        onWillPop: () {
          setState(() {
            screenState = 0;
          });
          return Future.value(false);
        },
        child: Scaffold(
          body: SizedBox(
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth / 15,
                        right: screenWidth / 15,
                        top: bottom > 0 ? screenHeight / 15 : 0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildImage(size),
                          buildAppName(),
                          buildText(),
                          screenState == 0 ? stateRegister() : stateOTP(),
                          buildNext(context, size),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector buildNext(BuildContext context, double size) {
    return GestureDetector(
      /*onTap: () {
                            if (screenState == 0) {
                              if (phoneController.text.isEmpty) {
                                showSnackBarText(
                                    "เบอร์โทรศัพท์ของคุณยังว่างอยู่!");
                              } else {
                                verifyPhone(
                                    countryDial + phoneController.text);
                              }
                            } else {
                              if (otpPin.length >= 6) {
                                verifyOTP();
                              } else {
                                showSnackBarText("กรอกรหัส OTP ให้ถูกต้อง!");
                              }
                            }
                          },*/
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Launcher();
        }));
      },
      child: Container(
        margin: EdgeInsets.only(top: size * 0.5),
        width: size * 0.9,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: MyCostant.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "ต่อไป",
            style: MyCostant().h5button(),
          ),
        ),
      ),
    );
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  Widget stateRegister() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "เบอร์โทรศัพท์",
        ),
        IntlPhoneField(
          style: TextStyle(),
          controller: phoneController,
          showCountryFlag: false,
          showDropdownIcon: false,
          initialValue: countryDial,
          onCountryChanged: (country) {
            setState(() {
              countryDial = "+" + country.dialCode;
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget stateOTP() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "เราเพิ่งส่งรหัสไปที่ ",
              ),
              TextSpan(
                text: countryDial + phoneController.text,
              ),
              TextSpan(
                text: "\nใส่รหัสที่นี่และจะสามารถดำเนินการต่อ!",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        PinCodeTextField(
          appContext: context,
          length: 6,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {
              otpPin = value;
            });
          },
          pinTheme: PinTheme(
            inactiveColor: Colors.black26,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "ไม่ได้รับรหัส? ",
              ),
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      screenState = 0;
                    });
                  },
                  child: Container(
                    child: Text(
                      "ยังไม่ได้รับรหัส? " + "ส่งอีกครั้ง",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container buildRemember() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
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
            onPressed: () =>
                Navigator.pushNamed(context, MyCostant.routeforgetpass),
            child: Text(
              'ลืมรหัสผ่าน?',
              style: TextStyle(color: MyCostant.dark),
            ),
          )
        ],
      ),
    );
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
                return Otp();
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
            // controller: passwordController,

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
          title: 'ยินดีต้อนรับ',
          textStyle: MyCostant().h2Style(),
        ),
        ShowTitle(
          title: 'กรุณากรอกเบอร์โทรศัพท์ของคุณ',
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
