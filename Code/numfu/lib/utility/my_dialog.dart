import 'dart:io';

import 'package:flutter/material.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:numfu/widgets/show_image.dart';
import 'package:numfu/widgets/show_title.dart';
import 'package:geolocator/geolocator.dart';

class MyDialog {
  Future<Null> alertLocationService(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(
            path: MyCostant.logo,
          ),
          title: ShowTitle(
            title: title,
            textStyle: TextStyle(
              fontSize: 20,
              fontFamily: "MN MINI Bold",
            ),
          ),
          subtitle: ShowTitle(
            title: message,
            textStyle: TextStyle(
              fontSize: 16,
              fontFamily: "MN MINI",
            ),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () async {
                //Navigator.pop(context);
                await Geolocator.openLocationSettings();
                exit(0);
              },
              child: Text('OK'))
        ],
      ),
    );
  }

  Future<Null> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: ShowImage(
            path: MyCostant.logo,
          ),
          title: ShowTitle(
            title: title,
            textStyle: MyCostant().h2Style(),
          ),
          subtitle: ShowTitle(
            title: message,
            textStyle: MyCostant().h3Style(),
          ),
        ),
        children: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
        ],
      ),
    );
  }
}
