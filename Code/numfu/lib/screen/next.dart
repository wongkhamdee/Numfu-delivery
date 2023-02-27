import 'package:flutter/material.dart';
import 'package:numfu/screen/index.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Next extends StatefulWidget {
  static const routeName = '/';

  const Next({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NextState();
  }
}

class _NextState extends State<Next> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'กระเป๋าเงิน',
          style: MyCostant().headStyle(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return buildCategory();
              },
            ),
          )
        ],
      )),
    );
  }
}

class buildCategory extends StatelessWidget {
  const buildCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Stack(children: [
        Container(
          height: 50,
          width: 60,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text('ทั้งหมด'),
          ),
        )
      ]),
    );
  }
}
