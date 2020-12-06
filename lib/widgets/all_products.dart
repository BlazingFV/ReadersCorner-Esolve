import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_solve/models/products_provider.dart';
import 'package:e_solve/widgets/product_item.dart';
import 'package:e_solve/widgets/products_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    int _current = 0;
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(0),
        child: CarouselSlider.builder(
          options: CarouselOptions(
              initialPage: 0,
              viewportFraction: 1,
              enlargeCenterPage: false,
              aspectRatio: 2.0,
              autoPlay: true,
              height: 250,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          itemBuilder: (context, i) {
            final int first = i ;
            final int second = first + 2;
            return Row(
              children: [first, second].map((idx) {
                return Expanded(
                  flex: 1,
                  child: ChangeNotifierProvider.value(
                    value: products[idx],
                    child: productData.items.length <= 0
                        ? Text('No Items added yet...')
                        : ProductItem(),
                  ),
                );
              }).toList(),
            );
          },
          itemCount: (products.length / 2).round(),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(3, 10, 0, 0),
        child: ProductsList(),
      ),
    ]);
  }
}
