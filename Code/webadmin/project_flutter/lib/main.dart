import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_flutter/authentication/Login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyByf9Caz-QfyYAULa9oQgYSfPd8yY8FYVM",
      appId: "1:205886811212:web:8348133adce078c9f958e9",
      messagingSenderId: "205886811212",
      projectId: "numfu-d9258",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Admin Web Numfu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const Loginpage());
  }
}
