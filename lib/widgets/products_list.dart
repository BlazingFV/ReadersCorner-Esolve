import 'package:e_solve/models/products_provider.dart';
import 'package:e_solve/widgets/product_item.dart';
import 'package:e_solve/widgets/product_tile_shop.dart';
import 'package:e_solve/widgets/produts_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    return Container(
      
      width: 160,
      height: 430,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
       
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ProductTileShop(),
        ),
        itemCount: products.length,
      ),
    );
  }
}
