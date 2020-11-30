import 'package:e_solve/screens/login_screen.dart';
import 'package:e_solve/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/introoo.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              signUpButton(context),
              loginButton(context),
              skipText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget skipText() {
    return InkWell(
      onTap: (){},
          child: Text(
        'SKIP',
        style: TextStyle(
          fontSize: 23,
          shadows: [Shadow(color: Colors.white, offset: Offset(0, -1))],
          color: Colors.transparent,
          decoration: TextDecoration.underline,
          decorationColor: Colors.white,
          decorationThickness: 1,
        ),
      ),
    );
  }

  InkWell signUpButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => RegisterScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(85, 280, 85, 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1.8),
          ),
          child: Center(
            child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => RegisterScreen()));
              },
              child: Text(
                'SIGN UP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  letterSpacing: 2.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InkWell loginButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => LoginScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(85, 25, 85, 75),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1.8),
          ),
          child: Center(
            child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  letterSpacing: 2.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
