import 'package:flutter/material.dart';
import 'package:numful/screen/index.dart';
import 'package:numful/screen/login.dart';

class forgetpass extends StatefulWidget {
  @override
  State<forgetpass> createState() => _forgetpassState();
}

class _forgetpassState extends State<forgetpass> {
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
              Text("ลืมรหัสผ่าน", style: TextStyle(fontSize: 40)),
              Text("กรุณาใส่อีเมลของคุณ แล้วเราจะส่งลิงค์เพื่อคืนบัญชีของคุณ",
                  style: TextStyle(fontSize: 15)),
              SizedBox(
                height: 80,
              ),
              TextField(
                cursorHeight: 20,
                decoration: InputDecoration(
                  labelText: 'อีเมล',
                  hintText: "กรอกเบอร์อีเมลของคุณ",
                  suffixIcon: Icon(Icons.email),
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
                    // background color

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
                    return Login();
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
