import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_solve/models/products_provider.dart';
import 'package:e_solve/widgets/product_item.dart';
import 'package:e_solve/widgets/products_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(0),
        child: CarouselSlider.builder(
          options: CarouselOptions(
            initialPage: 0,
            viewportFraction: 0.86,
            autoPlay: true,
            height: 250,
          ),
          itemBuilder: (context, i) => ChangeNotifierProvider.value(
            value: products[i],
            child: productData.items.length <= 0
                ? Text('No Items added yet...')
                : ProductItem(),
          ),
          itemCount: products.length,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductsList(),
      ),
    ]);
  }
}
