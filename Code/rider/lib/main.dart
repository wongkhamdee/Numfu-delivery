import 'package:flutter/material.dart';
import 'package:rider/screen/Launcher.dart';
import 'package:rider/screen/index.dart';
import 'package:rider/utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/Luncher': (BuildContext context) => Launcher(),
};
String? initlalRoute;
void main() {
  initlalRoute = MyCostant.routeLuncher;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyCostant.appName,
      routes: map,
      initialRoute: initlalRoute,
      theme: ThemeData(
        fontFamily: 'MN',
        //textTheme: GoogleFonts.promptTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.orange,
        backgroundColor: Colors.white,
      ),
    );
  }
}
