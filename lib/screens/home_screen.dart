import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_solve/models/products_provider.dart';
import 'package:e_solve/widgets/all_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  var _isLoading = false;
  final globalKey = GlobalKey<ScaffoldState>();
  PageController pageController;
  int pageIndx = 0;

  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }

  @override
  void didChangeDependencies() {
    pageController = PageController();
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refresh(BuildContext ctx) async {
    await Provider.of<Products>(ctx).fetchAndSetProducts();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      pageIndx = pageIndex;
    });
  }

  changePage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white70,
        onTap: changePage,
        currentIndex: pageIndx,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              color: Colors.grey,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              color: Colors.grey,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.grey,
            ),
            label: 'My Account',
          ),
        ],
      ),
      key: globalKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CupertinoActivityIndicator(animating: true))
          : PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              children: [
                  FutureBuilder(builder: (context, snapshot) {
                    return RefreshIndicator(
                        child: AllProducts(),
                        onRefresh: () => _refresh(context));
                  }),
                ]),
    );
  }
}
