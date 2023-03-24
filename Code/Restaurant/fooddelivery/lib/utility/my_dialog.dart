import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fooddelivery/utility/my_constant.dart';
import 'package:fooddelivery/widgets/show_images.dart';
import 'package:fooddelivery/widgets/show_titles.dart';
import 'package:geolocator/geolocator.dart';

class MyDialog {
  Future<Null> alertLocationService(BuildContext context, String title,String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImages(
            path: MyConstant.logo,
          ),
          title: ShowTitles(
            
            title: title,
            textStyle: TextStyle(
              fontSize: 20,
              fontFamily: "MN MINI Bold",
            ),
          ),
          subtitle: ShowTitles(
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
}
