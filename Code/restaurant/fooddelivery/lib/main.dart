import 'package:flutter/material.dart';
import 'package:fooddelivery/states/authen.dart';
import 'package:fooddelivery/states/buyer_service.dart';
import 'package:fooddelivery/states/create_account.dart';
import 'package:fooddelivery/states/create_account2.dart';
import 'package:fooddelivery/states/rider_service.dart';
import 'package:fooddelivery/states/saler_service.dart';
import 'package:fooddelivery/utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/buyerService': (BuildContext context) => BuyerService(),
  '/salerService': (BuildContext context) => SalerService(),
  '/riderService': (BuildContext context) => RiderService(),
  '/createAccount2': (BuildContext context) => CreateBussinessDetail(),
};

String? initalRoute;

void main() {
  initalRoute = MyConstant.routeAuthen;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyConstant.appName,
      routes: map,
      initialRoute: initalRoute,
    );
  }
}
