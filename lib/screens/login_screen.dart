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
            SizedBox(
              height: 75,
            ),
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

  Padding passwordTextField() {
    return Padding(
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 45),
            child: TextFormField(
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
                hintText: 'PASSWORD',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          );
  }

  Padding userNameTextField() {
    return Padding(
            padding: const EdgeInsets.fromLTRB(10, 100, 10, 25),
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
                hintText: 'USERNAME',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          );
  }

  InkWell registerButton() {
    return InkWell(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 0, 10),
            child: Text.rich(
              TextSpan(
                text: 'Don\'t have an account?',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(
                      text: 'Sign up',
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
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          width: double.infinity,
          height: 75,
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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 75,
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
              "Forgot Password?",
              style: TextStyle(
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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Color(0xffffab40),
        width: double.infinity,
        height: 75,
        child: FlatButton(
          onPressed: () {},
          child: Text(
            'LOGIN',
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
