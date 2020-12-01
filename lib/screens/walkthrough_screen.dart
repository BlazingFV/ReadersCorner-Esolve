import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_solve/screens/intro_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class WalkThrough extends StatefulWidget {
  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  List imgList = [
    'assets/images/02.jpg',
    'assets/images/03.jpg',
    'assets/images/04.jpg',
  ];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return Stack(children: [
            CarouselSlider(
              options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                scrollDirection: Axis.vertical,
                enableInfiniteScroll: false,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: imgList
                  .map((item) => InkWell(
                        onTap: () {
                          if (item == 'assets/images/04.jpg') {
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => IntroScreen()));
                          }
                        },
                        child: Container(
                          child: Center(
                            child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                              height: height,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ]);
        },
      ),
    );
  }
}
