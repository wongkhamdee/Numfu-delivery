import 'package:flutter/material.dart';
import 'package:numful/screen/login.dart';
import 'package:google_fonts/google_fonts.dart';

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
          textTheme: GoogleFonts.kanitTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.orange,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        home: Login());
  }
}
