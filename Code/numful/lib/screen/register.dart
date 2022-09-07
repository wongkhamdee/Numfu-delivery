import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สมัครสมาชิก"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'อีเมล',
                    hintText: 'กรอกอีเมลของคุณ',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'รหัสผ่าน',
                    hintText: 'กรอกรหัสผ่านของคุณ',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ชื่อจริง',
                    hintText: 'กรอกชื่อของคุณ',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'นามสกุล',
                    hintText: 'กรอกนามสกุลของคุณ',
                  ),
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("ต่อไป"),
                      onPressed: () {},
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
