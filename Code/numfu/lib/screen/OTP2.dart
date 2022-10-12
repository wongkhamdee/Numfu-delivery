import 'package:flutter/material.dart';
import 'package:numfu/screen/Launcher.dart';
import 'package:numfu/screen/login.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:numfu/widgets/show_title.dart';

class Otp2 extends StatefulWidget {
  @override
  State<Otp2> createState() => _Otp2State();
}

class _Otp2State extends State<Otp2> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("กรอกรหัส OTP ของคุณลงที่นี่",
                  style: TextStyle(fontSize: 25)),
              SizedBox(
                height: 30,
              ),
              /*OtpTextField(
                numberOfFields: 5,
                borderColor: Color.fromARGB(255, 255, 159, 81),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Codessdsdd"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                },
              ),*/
              SizedBox(
                height: 60,
              ),
              buildNext(size),
            ],
          ),
        ),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Login();
              }));
            },
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
