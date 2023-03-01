import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooddelivery/utility/my_dialog.dart';
import 'package:fooddelivery/widgets/show_progress.dart';
import 'package:fooddelivery/widgets/show_titles.dart';
import 'package:fooddelivery/utility/my_constant.dart';
import 'package:fooddelivery/widgets/show_images.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreateBussinessDetail extends StatefulWidget {
  const CreateBussinessDetail({super.key});

  @override
  State<CreateBussinessDetail> createState() => _CreateBussinessDetailState();
}

class _CreateBussinessDetailState extends State<CreateBussinessDetail> {
  double? lat, lng;
  //TextEditingController controller = new TextEditingController();
  //List<String> type = ["a", "b", "c", "d"];
  //bool displaytype = false;
  @override
  void initState() {
    super.initState();
    CheckPermission();
  }

  Future<Null> CheckPermission() async {
    bool locationService;
    LocationPermission locationPermission;

    locationService = await Geolocator.isLocationServiceEnabled();
    if (locationService) {
      print("Service Location Open");

      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
              context, 'ไม่อนุญาตให้เเชร์ Location', 'โปรเเชร์ Location');
        } else {
          findLatLng();
        }
      } else {
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
              context, 'ไม่อนุญาตให้เเชร์ Location', 'โปรเเชร์ Location');
        } else {
          findLatLng();
        }
      }
    } else {
      print("Service Location Close");
      MyDialog().alertLocationService(
          context,
          'คุณยังไม่ได้ทำการเปิด Location Service',
          'กรุณาเปิด Location Service');
    }
  }

  Future<Null> findLatLng() async {
    print('findLatLan ==> Work');
    Position? position = await findPosition();
    setState(() {
      lat = position!.latitude;
      lng = position.longitude;
      print('lat = $lat, lng = $lng');
    });
  }

  Future<Position?> findPosition() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      return null;
    }
  }

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
          style: TextStyle(
              color: Colors.black, fontSize: 36, fontFamily: "MN MINI"),
        ),
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          children: [
            BuildNameStore(size),
            BuildTitle('เเสดงพิกัดปัจจุบัน'),
            BuildMap(),
            BuildNextPage(size),

            //BuildType(size),
          ],
        ),
      ),
    );
  }

  Set<Marker> setMarker() => <Marker>[
        Marker(
          markerId: MarkerId('id'),
          position: LatLng(lat!, lng!),
          infoWindow: InfoWindow(title: 'ตำเเหน่งปัจจุบัน', snippet: 'Lat = $lat, lng = $lng'),
        ),
      ].toSet();

  Widget BuildMap() => Container(
        //color: Colors.grey,
        width: double.infinity,
        height: 200,
        child: lat == null
            ? ShowProgress()
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(lat!, lng!),
                  zoom: 16,
                ),
                onMapCreated: (controller) {},
                markers: setMarker(),
              ),
      );

  ShowTitles BuildTitle(String title) {
    return ShowTitles(
      title: title,
      textStyle: TextStyle(
        color: Colors.black,
        fontFamily: "MN MINI Bold",
      ),
    );
  }

  // Row BuildType(double size) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Container(
  //         margin: EdgeInsets.only(top: 60),
  //         width: size * 0.9,
  //         child: TextFormField(
  //           controller: controller,
  //           decoration: InputDecoration(
  //             floatingLabelBehavior: FloatingLabelBehavior.always,
  //             contentPadding: EdgeInsets.only(left: 20),
  //             suffixIcon: GestureDetector(
  //               onTap: () {
  //                 setState(() {
  //                   displaytype = !displaytype;
  //                 });
  //               },
  //               child: Icon(
  //                 Icons.list,
  //                 color: Colors.black,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //       displaytype
  //           ? Container(
  //               width: size * 0.9,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(30),
  //                 color: Colors.black,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.grey.withOpacity(0.3),
  //                     spreadRadius: 1,
  //                     blurRadius: 3,
  //                     offset: Offset(0, 1),
  //                   ),
  //                 ],
  //               ),
  //               child: ListView.builder(
  //                   itemCount: type.length,
  //                   itemBuilder: ((context, index) {
  //                     return GestureDetector(
  //                       onTap: () {
  //                         setState(() {
  //                           controller.text = (index + 1).toString();
  //                         });
  //                       },
  //                       child: ListTile(
  //                         title: Text(type[index]),
  //                       ),
  //                     );
  //                   })),
  //             )
  //           : SizedBox()
  //     ],
  //   );
  // }

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
              'เสร็จสิ้น',
              style: TextStyle(
                fontSize: 20,
                fontFamily: "MN MINI",
              ),
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
          margin: EdgeInsets.only(top: 60),
          width: size * 0.9,
          child: TextFormField(
            maxLength: 255,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: TextStyle(
                color: Colors.black,
                fontFamily: "MN MINI",
                fontSize: 19,
              ),
              hintStyle: TextStyle(
                fontFamily: "MN MINI",
                fontSize: 16,
              ),
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
