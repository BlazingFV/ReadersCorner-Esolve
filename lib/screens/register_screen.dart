import 'package:e_solve/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  var checkBox = false;
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: Image(
            image: AssetImage('assets/images/intro.jpg'),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildUploadPhoto(),
          buildFirstNameField(),
          buildLastNameField(),
          buildAddressField(),
          buildPhoneNumberField(),
          buildZipCode(),
          buildUserNameField(),
          buildPasswordField(),
          buildConfirmPasswordField(),
          buildEmailField(),
          buildCheckBox(),
          loginButton(),
          alreadyHaveAnAccountButton(),
        ],
      )),
    );
  }

  Padding buildUploadPhoto() {
    return Padding(
          padding:const EdgeInsets.fromLTRB(15, 190, 15, 0),
          child: InkWell(
            onTap: (){},
                        child: Center(
              child: Container(
                height: 150,
                width: 150,
                color: Colors.grey[400],
                child: Icon(Icons.camera_alt_rounded,color:Colors.black54,size:85),
              ),
            ),
          ),
        );
  }

  Padding buildCheckBox() {
    return Padding(
          padding: const EdgeInsets.fromLTRB(5, 15, 10, 0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 85,
                  width: 260,
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      controlAffinity: ListTileControlAffinity.leading,
                      subtitle: Text('I AGREE TO READER\'S CORNER TERMS OF SERVICE',softWrap: true,),
                      activeColor: Colors.black12,
                      checkColor: Colors.black,
                      value: checkBox,
                      onChanged: (newValue) {
                        setState(() {
                          checkBox = newValue;
                        });
                      }),
                ),
              ],
            ),
          ),
        );
  }
  InkWell alreadyHaveAnAccountButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
            child: Text.rich(
              TextSpan(
                text: 'هل لديك حساب.؟',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(
                      text: ' تسجيل الدخول',
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

  Padding buildFirstNameField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
      child: TextFormField(
        controller: _firstNameController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value.isEmpty || value.length < 6) {
            return 'Please enter at least 6 characters.';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: 'الاسم الاول',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildLastNameField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: TextFormField(
        controller: _lastNameController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value.isEmpty || value.length < 6) {
            return 'Please enter at least 6 characters.';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: 'الاسم الاخير',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildAddressField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: TextFormField(
        controller: _addressController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value.isEmpty || value.length < 6) {
            return 'Please enter at least 6 characters.';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: 'العنوان',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildPhoneNumberField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: TextFormField(
        controller: _phoneNumberController,
        keyboardType: TextInputType.phone,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value.isEmpty || value.length < 11) {
            return 'Please enter a valid Phone Number';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: 'رقم الهاتف',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildZipCode() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: TextFormField(
        controller: _zipCodeController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a valid Zip Code.';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: 'الرمز البريدي',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildUserNameField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
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

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
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

  Widget buildConfirmPasswordField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: TextFormField(
        obscureText: true,
        controller: _confirmpasswordController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value.isEmpty || value.length < 6) {
            return 'Please enter at least 6 characters. ';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: 'تاكيد الرقم السري',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: TextFormField(
        obscureText: true,
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value.isEmpty || value.length < 6) {
            return 'Please enter at least 6 characters. ';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: 'البريد الإلكتروني',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
   Padding loginButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: Container(
        color: Color(0xffffab40),
        width: double.infinity,
        height: 65,
        child: FlatButton(
          onPressed: () {},
          child: Text(
            'التسجيل',
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
