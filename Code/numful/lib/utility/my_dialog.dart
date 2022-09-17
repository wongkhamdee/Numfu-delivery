import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:numful/utility/my_constant.dart';
import 'package:numful/widgets/show_image.dart';
import 'package:numful/widgets/show_title.dart';

class MyDialog {
  Future<Null> alertLocationService(
      BuildContext context, String title, message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(path: MyCostant.logo),
          title: ShowTitle(title: title, textStyle: MyCostant().h3Style()),
          subtitle: ShowTitle(title: message, textStyle: MyCostant().h4Style()),
        ),
        actions: [
          TextButton(
              onPressed: () async {
                await Geolocator.openLocationSettings();
                exit(0);
              },
              child: Text('OK'))
        ],
      ),
    );
  }
}
