import 'package:e_solve/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            logoImage(),
            userNameTextField(),
            SizedBox(
              height: 20,
            ),
            passwordTextField(),
            SizedBox(height: 35),
            loginButton(),
            SizedBox(height: 10),
            forgetPasswordButton(),
            SizedBox(height: 25),
            facebookLoginButton(),
            googleLoginButton(),
            SizedBox(height: 25),
            registerButton(),
          ],
        ),
      ),
    );
  }

  Padding logoImage() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 85, 10, 10),
      child: Image(
        image: AssetImage('assets/images/deer.png'),
      ),
    );
  }

  Padding passwordTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 45),
      child: TextFormField(
        obscureText: true,
        controller: _passwordController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value.isEmpty || value.length < 6) {
            return 'Please enter at least 6 characters. ';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: 'الرقم السري',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Padding userNameTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 95, 15, 25),
      child: TextFormField(
        controller: _userNameController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value.isEmpty || value.length < 6) {
            return 'Please enter at least 6 characters.';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: 'اسم المستخدم',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  InkWell registerButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => RegisterScreen(),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Text.rich(
              TextSpan(
                text: 'ليس لديك حساب؟ ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(
                      text: 'التسجيل',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding googleLoginButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: InkWell(
        child: Container(
          width: double.infinity,
          height: 65,
          child: SignInButton(
            Buttons.GoogleDark,
            mini: false,
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Padding facebookLoginButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Container(
        width: double.infinity,
        height: 65,
        child: SignInButton(
          Buttons.Facebook,
          mini: true,
          onPressed: () {},
        ),
      ),
    );
  }

  Padding forgetPasswordButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.5, 2, 0, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: Text(
              "هل نسيت كلمة المرور؟",
              style: TextStyle(
                fontSize: 14,
                shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
                color: Colors.transparent,
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 1,
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding loginButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 3.4),
      child: Container(
        color: Color(0xffffab40),
        width: double.infinity,
        height: 65,
        child: FlatButton(
          onPressed: () {},
          child: Text(
            'الدخول',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
            ),
          ),
        ),
      ),
    );
  }
}
