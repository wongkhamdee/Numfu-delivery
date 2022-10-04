import 'package:flutter/material.dart';
import 'package:numfu/screen/OTP2.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:numfu/widgets/show_title.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Otp extends StatefulWidget {
  @override
  State<Otp> createState() => _OtpState();
}

final phone = MultiValidator([
  RequiredValidator(errorText: 'กรุณากรอกเบอร์มือถือของคุณ'),
  MinLengthValidator(10, errorText: 'เบอร์โทรต้องมีความยาวอย่างน้อย 10 ตัว'),
]);

class _OtpState extends State<Otp> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
              buildtext('ยืนยันหมายเลขโทรศัพท์มือถือของคุณ'),
              buildtext2('กรอกเบอร์โทรศัพท์ของคุณ 10 หลัก'),
              buildtext2('+66XXXXXXXXX'),
              buildPhone(size),
              buildNext(size),
            ],
          ),
        ),
      ),
    );
  }

  Container buildtext(String title) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            children: [
              ShowTitle(title: title, textStyle: MyCostant().h2Style()),
            ],
          ),
        ],
      ),
    );
  }

  Container buildtext2(title2) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          ShowTitle(title: title2, textStyle: MyCostant().h3Style()),
        ],
      ),
    );
  }

  Row buildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          width: size * 0.9,
          child: TextFormField(
            keyboardType: TextInputType.phone,
            style: TextStyle(fontSize: 18),
            validator: phone,
            decoration: InputDecoration(
              labelStyle: MyCostant().h4Style(),
              labelText: 'เบอร์โทร',
              hintText: "กรอกเบอร์โทรศัพท์ของคุณ",
              suffixIcon: Icon(Icons.phone_android),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyCostant.dark, width: 2),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyCostant.light, width: 2),
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
      ],
    );
  }

  Row buildNext(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.9,
          child: ElevatedButton(
            style: MyCostant().myButtonStyle(),
            onPressed: () {
              //if (formKey.currentState!.validate()) {}
              if (formKey.currentState!.validate() == false) {
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Otp2();
                }));
              }
            },
            child: ShowTitle(
              title: 'ต่อไป',
              textStyle: MyCostant().h5button(),
            ),
          ),
        ),
      ],
    );
  }
}
