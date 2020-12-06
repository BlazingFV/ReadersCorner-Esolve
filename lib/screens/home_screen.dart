import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_solve/models/products_provider.dart';
import 'package:e_solve/screens/categories_screen.dart';
import 'package:e_solve/screens/shop_screen.dart';
import 'package:e_solve/widgets/all_products.dart';
import 'package:e_solve/widgets/app_drawer.dart';
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
  String _title = "الرئيسية";

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
    String _temptitle = "";
    switch (pageIndex) {
      case 0:
        _temptitle = "الرئيسية";

        break;
      case 1:
        _temptitle = "التصنيفات";

        break;
      case 2:
        _temptitle = "المتجر";
        break;
      case 3:
        _temptitle = "حسابي";
        break;
    }
    setState(() {
      this.pageIndx = pageIndex;
      this._title = _temptitle;
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
      drawer: AppDrawer(),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white70,
        onTap: changePage,
        currentIndex: pageIndx,
        activeColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.category,
              color: Colors.blue,
            ),
            icon: Icon(
              Icons.category,
              color: Colors.grey,
            ),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.book,
              color: Colors.blue,
            ),
            icon: Icon(
              Icons.book,
              color: Colors.grey,
            ),
            label: 'المتجر',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.account_circle,
              color: Colors.blue,
            ),
            icon: Icon(
              Icons.account_circle,
              color: Colors.grey,
            ),
            label: 'حسابي',
          ),
        ],
      ),
      key: globalKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        title: Text(
          _title,
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
              physics: NeverScrollableScrollPhysics(),
              children: [
                FutureBuilder(builder: (context, snapshot) {
                  return RefreshIndicator(
                      child: AllProducts(), onRefresh: () => _refresh(context));
                }),
                CategoriesScreen(),
                ShopScreen(),
              ],
            ),
    );
  }
}
