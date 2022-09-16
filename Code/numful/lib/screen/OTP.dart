import 'package:flutter/material.dart';
import 'package:numful/screen/OTP2.dart';
import 'package:google_fonts/google_fonts.dart';

class OTP extends StatefulWidget {
  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
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
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
          //ป้องกันตอนย้อนกลับมาปุ่ม overflow
          child: Column(
            children: [
              Container(
                child: Row(
                  children: <Widget>[
                    Text("ยืนยันหมายเลขโทรศัพท์มือถือของคุณ",
                        style: TextStyle(fontSize: 25)),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      "กรอกเบอร์โทรศัพท์มือถือของคุณ",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      "+66xxxxxxxx",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                cursorHeight: 20,
                decoration: InputDecoration(
                  labelText: 'เบอร์โทร',
                  hintText: "กรอกเบอร์โทรศัพท์ของคุณ",
                  suffixIcon: Icon(Icons.phone),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
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
                        fontFamily: 'MN', fontSize: 20, color: Colors.white)),
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
