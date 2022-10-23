import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class promotion extends StatefulWidget {
  const promotion({Key? key}) : super(key: key);

  @override
  State<promotion> createState() => _promotionState();
}

class _promotionState extends State<promotion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('promotion'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("promotion").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Container(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: FittedBox(child: document["pro_details"]),
                  ),
                  title: Text(document["pro_discount"] + document["pro_name"]),
                  subtitle: Text(document['quantity']),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
