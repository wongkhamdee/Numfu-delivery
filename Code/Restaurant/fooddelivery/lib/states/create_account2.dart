import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooddelivery/widgets/show_titles.dart';
import 'package:fooddelivery/utility/my_constant.dart';
import 'package:fooddelivery/widgets/show_images.dart';

class CreateBussinessDetail extends StatefulWidget {
  const CreateBussinessDetail({super.key});

  @override
  State<CreateBussinessDetail> createState() => _CreateBussinessDetailState();
}

class _CreateBussinessDetailState extends State<CreateBussinessDetail> {
  final dropValue = ['ก๋วยเตี๋ยว', 'เบอร์เกอ', 'ข้าวต้ม'];
  String? selectValue = "";
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'รายละเอียดธุรกิจ',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          children: [
            BuildNameStore(size),
            BuildNextPage(size),
          ],
        ),
      ),
    );
  }

  Row BuildNextPage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          width: size * 0.9,
          height: 48,
          child: ElevatedButton(
            style: MyConstant().myButtonStyle(),
            onPressed: () {
              // Navigator.pushNamed(context, MyConstant.routeCreateAccount2);
            },
            child: Text(
              'ต่อไป',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }

  Row BuildNameStore(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 25),
          width: size * 0.9,
          child: TextFormField(
            maxLength: 255,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: TextStyle(color: Colors.black),
              labelText: 'ชื่อร้าน',
              hintText: 'กรุณากรอกชื่อร้านของคุณ',
              contentPadding: EdgeInsets.only(left: 20),
              suffixIcon: Icon(
                Icons.storefront_outlined,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
