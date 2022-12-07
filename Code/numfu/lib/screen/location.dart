import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:numfu/screen/select_address.dart';
import 'package:numfu/utility/my_dialog.dart';
import 'package:numfu/widgets/show_progress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:numfu/utility/my_constant.dart';
import 'package:numfu/widgets/show_title.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  double? lat, lng;
  /*final user = FirebaseAuth.instance.currentUser!;*/
  @override
  void initState() {
    super.initState();
    CheckPermisson();
  }

  Future<Null> CheckPermisson() async {
    bool locationService;
    LocationPermission locationPermission;

    locationService = await Geolocator.isLocationServiceEnabled();
    if (locationService) {
      print('ตำแหน่งที่ตั้งเปิดอยู่');

      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
              context, 'คุณไม่ได้อนุญาตให้แชร์ Location', 'กรุณาแชร์ Location');
        } else {
          // Find latlng
          findLatLng();
        }
      } else {
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
              context, 'คุณไม่ได้อนุญาตให้แชร์ ', 'กรุณาแชร์ Location');
        } else {
          // Find latlng
          findLatLng();
        }
      }
    } else {
      print('ตำแหน่งที่ตั้งถูกปิดอยู่');
      MyDialog().alertLocationService(context, 'Location Service ปิดอยู่ ?',
          'กรุณาเปิด Location Service ของคุณ');
    }
  }

  Future<Null> findLatLng() async {
    print('findLatLng ==> work');
    Position? position = await findPostion();
    setState(() {
      lat = position!.latitude;
      lng = position.longitude;
      print('lat' '$lat' 'lng' '$lng');
    });
  }

  Future<Position?> findPostion() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      return null;
    }
  }

  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: ListView(
            children: [
              buildMap(),
              buildEnter(size: size),
            ],
          )),
    );
  }

  Set<Marker> setMarker() => <Marker>[
        Marker(
            markerId: MarkerId('id'),
            position: LatLng(lat!, lng!),
            infoWindow: InfoWindow(
                title: 'คุณอยู่ที่นี่', snippet: 'Lat = $lat, Lng = $lng')),
      ].toSet();

  Container buildMap() {
    return Container(
        width: double.infinity,
        height: 600,
        child: lat == null
            ? ShowProgress()
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(lat!, lng!),
                  zoom: 16,
                ),
                onMapCreated: (controller) {},
                markers: setMarker(),
              ));
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.9,
          child: ElevatedButton(
            style: MyCostant().myButtonStyle(),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Select_a();
              }));
            },
            child: ShowTitle(
              title: 'เพิ่มที่อยู่',
              textStyle: MyCostant().h5button(),
            ),
          ),
        ),
      ],
    );
  }
}
