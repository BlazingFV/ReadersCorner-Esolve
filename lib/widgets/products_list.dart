import 'package:e_solve/models/products_provider.dart';
import 'package:e_solve/widgets/product_item.dart';
import 'package:e_solve/widgets/produts_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    return Container(
      width: 400,
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ProductsListWidget(),
        ),
        itemCount: products.length,
      ),
    );
  }
}
