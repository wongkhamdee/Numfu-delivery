import 'package:flutter/material.dart';
import 'package:numful/screen/login.dart';
import 'package:google_fonts/google_fonts.dart';

//ต้องลง pinput เพิ่ม

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Numful',
        theme: ThemeData(
          textTheme: GoogleFonts.promptTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.orange,
          backgroundColor: Colors.white,
        ),
        home: Login());
  }
}
