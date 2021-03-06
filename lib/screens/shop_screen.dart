import 'package:e_solve/models/products_provider.dart';
import 'package:e_solve/widgets/product_tile_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  static const routeName = '/shop-screen';
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    return Scaffold(
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.43,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          maxCrossAxisExtent: 250
        ),
        itemCount: products.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: products[index],
            child: productData.items.length <= 0
                ? Text('No Items added yet...')
                : ProductTileShop(),
          );
        },
      ),
    );
  }
}
