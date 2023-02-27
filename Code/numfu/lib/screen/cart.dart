import 'package:flutter/material.dart';
import 'package:numfu/screen/ordering.dart';
import 'package:numfu/utility/my_constant.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ตะกร้าสินค้า',
          style: MyCostant().headStyle(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Container(
          child: ListView(
            children: [
              const SizedBox(
                height: 0,
              ),
              buildBox(),
              const SizedBox(
                height: 10,
              ),
              Text(
                'สรุปคำสั่งซื้อ',
                style: MyCostant().h2Style(),
              ),
              SizedBox(
                height: 20,
              ),
              buildBoxmenu1(),
              buildDivider(),
              buildBoxmenu2(),
              buildDivider(),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'รวมค่าอาหาร',
                    style: MyCostant().h3Style(),
                  )),
                  Text(
                    '฿ 95',
                    style: MyCostant().h3Style(),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'ค่าจัดส่ง',
                    style: MyCostant().h3Style(),
                  )),
                  Text(
                    '฿ 15',
                    style: MyCostant().h3Style(),
                  ),
                ],
              ),
              buildDivider(),
              Text(
                'รายละเอียดการชำระเงิน',
                style: MyCostant().h2Style(),
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'ยอดเงินคงเหลือ',
                    style: MyCostant().h3Style(),
                  )),
                  Text(
                    '฿ 300',
                    style: MyCostant().h3Style(),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'ยอดรวมทั้งหมด',
                    style: MyCostant().h2Style(),
                  )),
                  Text(
                    '฿ 110',
                    style: MyCostant().h2Style(),
                  ),
                ],
              ),
              buildEnter(size: size),
            ],
          ),
        ),
      ),
    );
  }

  Container buildBox() {
    return Container(
      width: 400,
      height: 180,
      decoration: const BoxDecoration(
        color: Color(0xffFF8126),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'จัดส่งที่                                    ',
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xffffffff),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.navigate_next,
                        size: 30,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "หอพักกัลยรัตน์ - Kanlayarat Dormitory",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Soi Thawon Phruek, Lat Krabang, Lat Krabang, Bang...",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Row(
                    children: [
                      Text(
                        ' 0.8 กม. ',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Row buildAdd_remove1() {
  return Row(
    children: [
      Container(
        width: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF5F4F4),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.remove_circle,
                color: Color.fromARGB(255, 214, 214, 214),
              ),
            ),
            Text(
              '1',
              style: MyCostant().h3Style(),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_circle,
                color: Color(0xffFF8126),
              ),
            ),
          ],
        ),
      ),
      Text(
        '  ฿ 45',
        style: MyCostant().h3_1Style(),
      ),
    ],
  );
}

Row buildAdd_remove2() {
  return Row(
    children: [
      Container(
        width: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF5F4F4),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.remove_circle,
                color: Color.fromARGB(255, 214, 214, 214),
              ),
            ),
            Text(
              '1',
              style: MyCostant().h3Style(),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_circle,
                color: Color(0xffFF8126),
              ),
            ),
          ],
        ),
      ),
      Text(
        '  ฿ 50',
        style: MyCostant().h3_1Style(),
      ),
    ],
  );
}

Container buildBoxmenu1() {
  return Container(
    width: 400,
    height: 100,
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("img/1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ข้าวมันไก่ต้ม',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  buildAdd_remove1(),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Container buildBoxmenu2() {
  return Container(
    width: 400,
    height: 100,
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("img/2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ก๋วยเต๊่ยวน้ำใส',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  buildAdd_remove2(),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Divider buildDivider() {
  return const Divider(
    height: 25,
    color: Color(0xff4A4949),
  );
}

class buildEnter extends StatelessWidget {
  const buildEnter({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Ordering();
        }));
      },
      child: Container(
        margin: EdgeInsets.only(top: 0),
        width: size * 10,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: MyCostant.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "ยืนยันคำสั่งซื้อ",
            style: MyCostant().h5button(),
          ),
        ),
      ),
    );
  }
}
