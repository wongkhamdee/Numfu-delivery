import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:numful/screen/Launcher.dart';

class OTP2 extends StatefulWidget {
  @override
  State<OTP2> createState() => _OTP2State();
}

class _OTP2State extends State<OTP2> {
  @override
  Widget build(BuildContext context) {
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
              OtpTextField(
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
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 158, 87),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 168, vertical: 8),
                          textStyle: const TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: const Text('ต่อไป',
                          style: TextStyle(
                              fontFamily: 'MN',
                              fontSize: 20,
                              color: Colors.white)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Launcher();
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
