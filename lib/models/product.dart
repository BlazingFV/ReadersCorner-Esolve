import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String isbn;
  int id;
  String description;
  String details;
  String name;
  String slug;
  String image;
  int price;
  String authorName;
  int orderBy;
  int authorId;
  dynamic avgRate;
  int orderLimit;

  Product({
    this.isbn,
    this.id,
    this.description,
    this.details,
    this.name,
    this.slug,
    this.image,
    this.price,
    this.authorName,
    this.orderBy,
    this.authorId,
    this.avgRate,
    this.orderLimit,
  });
  factory Product.fromJson(Map<String,dynamic>data) => Product(
        isbn: data["isbn"],
        id: data["id"],
        description: data["description"] == null ? null : data["description"],
        details: data["details"],
        name: data["name"],
        slug: data["slug"],
        image: data["image"],
        price: data["price"],
        authorName: data["author_name"] == null ? null : data["author_name"],
        orderBy: data["orderBy"],
        authorId: data["author_id"] == null ? null : data["author_id"],
        avgRate: data["avg_rate"],
        orderLimit: data["order_limit"],
      );
}
