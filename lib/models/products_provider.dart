import 'dart:convert';

import 'package:e_solve/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class Products with ChangeNotifier {
  List<Product> _items = [];
  List<Product> get items {
    return [..._items];
  }

  fetchAndSetProducts() async {
    var url = 'http://readerscornerapi.esolve-eg.com/public/api/product';

    try {
      final response = await http.get(url);
      var extractedData = response.body;
      var jsonMap = json.decode(extractedData);
      if (extractedData == null) {
        return;
      }
      List<Product> loadedProduct = fromJsonArray(extractedData);
      print('$loadedProduct');
      List<Product> products = [];
      loadedProduct.forEach((product) {
        products.add(Product(
          id: product.id,
          authorId: product.authorId,
          authorName: product.authorName,
          avgRate: product.avgRate,
          description: product.description,
          details: product.details,
          image: product.image,
          isbn: product.isbn,
          name: product.name,
          orderBy: product.orderBy,
          orderLimit: product.orderLimit,
          price: product.price,
          slug: product.slug,
        ));
      });
      _items = products;
      print('$_items');
     notifyListeners();
      // print('$jsonMap');
    } catch (error) {
      print(error);
    }
  }

  List<Product> fromJsonArray(parsedJson) => List<Product>.from(
      json.decode(parsedJson).map((item) => Product.fromJson(item)));
}
