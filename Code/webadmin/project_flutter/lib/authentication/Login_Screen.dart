import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_flutter/main_screens/home_screen.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String adminemail = "";
  String adminpassword = "";

  allowAdminToLogin() async {
    SnackBar snackBar = const SnackBar(
      content: Text(
        "Checking Credentials, Please wait...",
        style: TextStyle(fontSize: 36, color: Colors.white),
      ),
      backgroundColor: Colors.pinkAccent,
      duration: Duration(seconds: 6),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    User? currentAdmin;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: adminemail,
      password: adminpassword,
    )
        .then((fAuth) {
      currentAdmin = fAuth.user;
    }).catchError((onError) {
      final snackBar = SnackBar(
        content: Text(
          "Error Occured: " + onError.toString(),
          style: const TextStyle(fontSize: 36, color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent,
        duration: const Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });

    if (currentAdmin != null) {
      await FirebaseFirestore.instance
          .collection("admins")
          .doc(currentAdmin!.uid)
          .get()
          .then((snap) {
        if (snap.exists) {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => const HomeScreen()));
        } else {
          SnackBar snackBar = const SnackBar(
            content: Text(
              "No record found, You are not an admin.",
              style: TextStyle(fontSize: 36, color: Colors.white),
            ),
            backgroundColor: Colors.pinkAccent,
            duration: Duration(seconds: 6),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFFE94057),
                Color(0xFFFF8126),
                Color(0xFFFEE337),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 480,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Administrator',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Please Login to you Account',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        onChanged: (value) {
                          adminemail = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          suffixIcon: Icon(
                            FontAwesomeIcons.envelope,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        onChanged: (value) {
                          adminpassword = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(
                            FontAwesomeIcons.eyeSlash,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forget Password?',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        allowAdminToLogin();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 270,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFFF8126),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
