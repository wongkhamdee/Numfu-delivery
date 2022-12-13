import 'package:flutter/material.dart';
import 'package:numfu/screen/cart.dart';
import 'package:numfu/utility/my_constant.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '',
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
                buildBanner(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text('ข้าวมันไก่ต้ม',
                            style: MyCostant().h2Style())),
                    Icon(Icons.favorite_border, size: 30, color: Colors.black),
                  ],
                ),
                Text('Chiken on rice', style: MyCostant().h4Style()),
                buildAdd_remove(),
                buildDivider(),
                Text('ไข่ต้ม', style: MyCostant().h3Style()),
                buildchoice1(),
                Text('ซีอิ๊วดำหวาน', style: MyCostant().h3Style()),
                buildchoice2(),
                Text('ขนาด', style: MyCostant().h3Style()),
                buildchoice3(),
                buildchoice4(),
                buildEnter(size: size),
              ],
            ),
          )),
    );
  }

  Row buildAdd_remove() {
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

  Divider buildDivider() {
    return const Divider(
      height: 20,
      color: Color(0xffD8D8D8),
    );
  }

  ClipRRect buildBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox.fromSize(
        child: Image.asset(
          'img/1.jpg',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
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
          return Cart();
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
            "เพิ่มไปยังตะกร้า",
            style: MyCostant().h5button(),
          ),
        ),
      ),
    );
  }
}

MaterialButton buildchoice1() {
  return MaterialButton(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(1.0))),
    onPressed: () {},
    color: MyCostant.white,
    child: Row(
      children: [
        Icon(
          Icons.check_box,
          color: MyCostant.primary,
          size: 20.0,
        ),
        Expanded(
          child: Text(
            ' ไข่ต้ม',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Text(
          '฿ 10',
          style: TextStyle(fontSize: 18),
        ),
      ],
    ),
  );
}

MaterialButton buildchoice2() {
  return MaterialButton(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(1.0))),
    onPressed: () {},
    color: MyCostant.white,
    child: Row(
      children: [
        Icon(
          Icons.check_box,
          color: MyCostant.primary,
          size: 20.0,
        ),
        Expanded(
          child: Text(
            ' ซีอิ๊วดำหวาน',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Text(
          '฿ 0',
          style: TextStyle(fontSize: 18),
        ),
      ],
    ),
  );
}

MaterialButton buildchoice3() {
  return MaterialButton(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(1.0))),
    onPressed: () {},
    color: MyCostant.white,
    child: Row(
      children: [
        Icon(
          Icons.check_box,
          color: MyCostant.primary,
          size: 20.0,
        ),
        Expanded(
          child: Text(
            ' จั๊มโบ้',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Text(
          '฿ 40',
          style: TextStyle(fontSize: 18),
        ),
      ],
    ),
  );
}

MaterialButton buildchoice4() {
  return MaterialButton(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(1.0))),
    onPressed: () {},
    color: MyCostant.white,
    child: Row(
      children: [
        Icon(
          Icons.check_box,
          color: MyCostant.primary,
          size: 20.0,
        ),
        Expanded(
          child: Text(
            ' พิเศษ',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Text(
          '฿ 20',
          style: TextStyle(fontSize: 18),
        ),
      ],
    ),
  );
}
