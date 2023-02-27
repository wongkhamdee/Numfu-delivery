import 'package:flutter/material.dart';
import 'package:numfu/screen/Launcher.dart';
import 'package:numfu/screen/index.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:numfu/widgets/show_title.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Select_a extends StatefulWidget {
  @override
  State<Select_a> createState() => _Select_aState();
}

class _Select_aState extends State<Select_a> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'เพิ่มที่อยู่',
          style: MyCostant().headStyle(),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.navigate_before,
              size: 38,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formKey,
          child: ListView(
            //padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
            children: [
              buildtext('ชื่อสถานที่*'),
              buildCate(size: size),
              buildAdressName(size),
              SizedBox(
                height: 25,
              ),
              buildtext('ที่อยู่*'),
              buildMap(),
              SizedBox(
                height: 25,
              ),
              buildtext('รายละเอียดที่อยู่(ถ้ามี)'),
              buildDetails(size),
              SizedBox(
                height: 25,
              ),
              buildtext2('**สามารถบันทึกได้สูงสุด 5 สถานที่**'),
              buildSave(size),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildMap() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xff525252),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 6, //or null
              decoration:
                  InputDecoration.collapsed(hintText: "ใส่ข้อเสนอแนะของคุณ"),
            ),
          )),
    );
  }

  Container buildtext(String title) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            children: [
              ShowTitle(title: title, textStyle: MyCostant().h3Style()),
            ],
          ),
        ],
      ),
    );
  }

  Container buildtext2(title2) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShowTitle(title: title2, textStyle: MyCostant().h3_1Style()),
        ],
      ),
    );
  }

  Row buildAdressName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.9,
          child: TextFormField(
            validator: RequiredValidator(errorText: 'กรุณากรอกชื่อที่อยู่'),
            decoration: InputDecoration(
              labelStyle: MyCostant().h4Style(),
              hintText: "ตั้งชื่อที่อยู่ เช่น บ้าน ที่ทำงาน คอนโด",
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyCostant.dark, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyCostant.light, width: 2),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }

  Row buildDetails(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: size * 0.9,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyCostant().h4Style(),
              hintText: "เช่น ชั้น หมายเลขห้อง",
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyCostant.dark, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyCostant.light, width: 2),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }

  Row buildSave(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          width: size * 0.9,
          child: ElevatedButton(
            style: MyCostant().myButtonStyle(),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Launcher();
              }));
            },
            child: ShowTitle(
              title: 'บันทึก',
              textStyle: MyCostant().h5button(),
            ),
          ),
        ),
      ],
    );
  }
}

class buildCate extends StatelessWidget {
  const buildCate({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, top: 10),
          width: size * 0.2,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: MyCostant.dark,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
            color: MyCostant.dark2,
          ),
          child: Center(
            child: Text(
              "บ้าน",
              style: MyCostant().h6_2button(),
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: size * 0.2,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: MyCostant.dark,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
            color: MyCostant.dark2,
          ),
          child: Center(
            child: Text(
              "ที่ทำงาน",
              style: MyCostant().h6_2button(),
            ),
          ),
        ),
      ],
    );
  }
}
