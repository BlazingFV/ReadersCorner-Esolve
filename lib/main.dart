import 'package:e_solve/models/products_provider.dart';
import 'package:e_solve/screens/categories_screen.dart';
import 'package:e_solve/screens/home_screen.dart';
import 'package:e_solve/screens/intro_screen.dart';
import 'package:e_solve/screens/shop_screen.dart';
import 'package:e_solve/screens/walkthrough_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-solve',
        home: WalkThrough(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
          ShopScreen.routeName: (ctx) => ShopScreen(),
        },
      ),
    );
  }
}
