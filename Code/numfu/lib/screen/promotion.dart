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
  Query dbRef = FirebaseDatabase.instance.ref().child('promotion');

  Widget listItem({required Map promotion}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: MyCostant.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Proname'),
          const SizedBox(
            height: 5,
          ),
          Text('Prodetails'),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.youtube_searched_for,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map promotion = snapshot.value as Map;
            promotion['key'] = snapshot.key;

            return listItem(promotion: promotion);
          },
        ),
      ),
    );
  }
}
