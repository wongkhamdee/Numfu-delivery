import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:numful/screen/OTP.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              Image.asset(
                "img/logo.png",
                height: 100,
              ),
              Text("Numful", style: TextStyle(fontSize: 30)),
              SizedBox(
                height: 120,
              ),
              TextField(
                cursorHeight: 20,
                decoration: InputDecoration(
                  labelText: 'อีเมล',
                  hintText: "กรอกอีเมลของคุณ",
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
                height: 15,
              ),
              TextField(
                cursorHeight: 20,
                decoration: InputDecoration(
                  labelText: 'รหัสผ่าน',
                  hintText: "กรอกรหัสผ่านของคุณ",
                  suffixIcon: Icon(Icons.password),
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
                height: 15,
              ),
              TextField(
                cursorHeight: 20,
                decoration: InputDecoration(
                  labelText: 'ชื่อจริง',
                  hintText: "กรอกชื่อจริงของคุณ",
                  suffixIcon: Icon(Icons.person),
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
                height: 15,
              ),
              TextField(
                cursorHeight: 20,
                decoration: InputDecoration(
                  labelText: 'นามสกุล',
                  hintText: "กรอกนามสกุลของคุณ",
                  suffixIcon: Icon(Icons.person),
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
                        horizontal: 139, vertical: 8),
                    textStyle: const TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: const Text('ต่อไป',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OTP();
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
