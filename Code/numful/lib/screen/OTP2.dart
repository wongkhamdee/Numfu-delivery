import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTP2 extends StatefulWidget {
  @override
  State<OTP2> createState() => _OTP2State();
}

class _OTP2State extends State<OTP2> {
  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: SingleChildScrollView(
          //ป้องกันตอนย้อนกลับมาปุ่ม overflow
          child: Column(
            children: [
              Text("ยืนยันหมายเลขโทรศัพท์มือถือของคุณ",
                  style: TextStyle(fontSize: 20)),
              Text(
                "ใส่รหัส 4 หลักที่ส่งไปยังเบอร์มือถือของท่าน",
              ),
              Text(
                "+66xxxxxxxx",
              ),
              SizedBox(
                height: 120,
              ),
              OtpTextField(
                numberOfFields: 5,
                borderColor: Color.fromARGB(255, 255, 159, 81),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    // background color

                    primary: Color.fromARGB(255, 255, 158, 87),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 139, vertical: 8),
                    textStyle: const TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: const Text('ต่อไป',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OTP2();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
