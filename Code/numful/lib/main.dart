import 'package:flutter/material.dart';
import 'package:numful/screen/Launcher.dart';
import 'package:numful/screen/OTP.dart';
import 'package:numful/screen/OTP2.dart';
import 'package:numful/screen/forgetpass.dart';
import 'package:numful/screen/login.dart';
import 'package:numful/screen/register.dart';
import 'package:numful/utility/my_constant.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Map<String, WidgetBuilder> map = {
  '/login': (BuildContext Context) => Login(),
  '/register': (BuildContext Context) => Register(),
  '/OTP': (BuildContext Context) => Otp(),
  '/OTP2': (BuildContext Context) => Otp2(),
  '/forgetpass': (BuildContext Context) => Forgetpass(),
  '/Launcher': (BuildContext Context) => Launcher(),
};

String? initlalRoute;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initlalRoute = MyCostant.routeluncher;
  runApp(MyApp());
}
/*void main() async {
  await Hive.initFlutter();
  initlalRoute = MyCostant.routelogin;
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyCostant.appName,
      routes: map,
      //initialRoute: initlalRoute,
      theme: ThemeData(
        fontFamily: 'MN',
        //textTheme: GoogleFonts.promptTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.orange,
        backgroundColor: Colors.white,
      ),
      home: Login(),
    );
  }
}

class MainPage extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Launcher();
              } else {
                return Login();
              }
            }),
      );
}
/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Numfu',
        theme: ThemeData(
          fontFamily: 'MN',
          //textTheme: GoogleFonts.promptTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.orange,
          backgroundColor: Colors.white,
        ),
        home: Login());
  }
}*/
