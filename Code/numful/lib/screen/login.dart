import 'package:flutter/material.dart';
import 'package:numful/screen/index.dart';
import 'package:numful/screen/register.dart';

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: 80,
                  ),
                  Text("ยินดีต้อนรับ", style: TextStyle(fontSize: 20)),
                  Text("ลงชื่อเข้าใช้บัญชีของคุณ",
                      style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    cursorHeight: 20,
                    decoration: InputDecoration(
                      labelText: 'อีเมล',
                      hintText: "กรอกอีเมลของคุณ",
                      suffixIcon: Icon(Icons.email),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
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
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
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
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: null,
                        onChanged: null,
                      ),
                      Text('ลืมรหัสผ่าน'),
                    ],
                  )),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 158, 87),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 139, vertical: 8),
                        textStyle: const TextStyle(fontSize: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Text('เข้าสู่ระบบ',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return index();
                      }));
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("หรือ", style: TextStyle(fontSize: 15)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // background color

                        primary: Color.fromARGB(255, 255, 158, 87),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 130, vertical: 8),
                        textStyle: const TextStyle(fontSize: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Text('สมัครสมาชิก',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Register();
                      }));
                    },
                  ),
                ],
              ),
            )));
  }
}
