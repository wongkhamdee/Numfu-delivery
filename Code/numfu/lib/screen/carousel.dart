import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

List<String> imgList = [
  'img/B1.png',
  'img/B2.png',
  'img/B3.png',
];

final List<Widget> imgSliders = imgList
    .map((e) => Container(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                e,
                fit: BoxFit.cover,
                width: double.infinity,
              )),
        ))
    .toList();

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
              items: imgSliders,
              options: CarouselOptions(
                aspectRatio: 2.0,
                viewportFraction: 0.95,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((e) {
              int index = imgList.indexOf(e);
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4)),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
