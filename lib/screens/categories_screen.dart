import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  static const routeName = '/categories-screen';
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        buildContainerTextAndImage('الكتب العربية'),
        SizedBox(height: 10),
        buildContainerTextAndImage('متجر صفقة'),
        SizedBox(height: 10),
        buildContainerTextAndImage('الهدايا و الاشياء الثابتة'),
        SizedBox(height: 10),
        buildContainerTextAndImage('المجموعات ومجموعات الهدايا'),
      ]),
    );
  }

  Container buildContainerTextAndImage(String text) {
    return Container(
      child: Stack(
        children: [
          Image.asset('assets/images/introoo.jpg'),
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8),
             
              child: Center(
                child: Text(
                  text,
                  maxLines: 4,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
