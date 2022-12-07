import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCostant {
  // general
  static String appName = 'Numfu';

  // Route
  static String routelogin = '/login';
  static String routeregister = '/register';
  static String routeOTP = '/OTP';
  static String routeOTP2 = '/OTP2';
  static String routeforgetpass = '/forgetpass';
  static String routeluncher = '/Launcher';

  // Image
  static String logo = 'img/logo.png';

  // Color
  static Color primary = Color(0xffff8126);
  static Color pritwo = Color(0xffFFC077);
  static Color dark = Color(0xff757575);
  static Color light = Color(0xffffb257);
  static Color black = Color(0xff000000);
  static Color white = Color(0xffffffff);
  static Color red = Color(0xffFF3326);

  // Style
  TextStyle h1Style() => TextStyle(
        fontSize: 36,
        color: black,
        fontWeight: FontWeight.normal,
      );

  TextStyle h1tStyle() => TextStyle(
        fontSize: 36,
        color: black,
        fontWeight: FontWeight.normal,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 25,
        color: black,
        fontWeight: FontWeight.normal,
      );
  TextStyle h3Style() => TextStyle(
        fontSize: 18,
        color: black,
        fontWeight: FontWeight.normal,
      );
  TextStyle h4Style() => TextStyle(
        fontSize: 16,
        color: dark,
        fontWeight: FontWeight.normal,
      );
  TextStyle h44Style() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.normal,
      );
  TextStyle headStyle() => TextStyle(
        fontSize: 36,
        color: black,
      );

  TextStyle h5button() => TextStyle(
        fontSize: 20,
        color: white,
        fontWeight: FontWeight.normal,
      );
  TextStyle h6button() => TextStyle(
        fontSize: 20,
        color: dark,
        fontWeight: FontWeight.normal,
      );

  // Button
  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        primary: MyCostant.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
}
