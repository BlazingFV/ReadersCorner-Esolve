import 'package:e_solve/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTileShop extends StatefulWidget {
  @override
  _ProductTileShopState createState() => _ProductTileShopState();
}

class _ProductTileShopState extends State<ProductTileShop> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Card(
      elevation: 2,
      child: Container(
        width: 160,
        
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                '${product.name}',
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text('By'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                '${product.authorName}'.trim(),
                maxLines: 2,
                softWrap: true,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              leading: Text(
                'EGP${product.price}',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Icon(Icons.shopping_cart),
            ),
          ],
        ),
      ),
    );
  }
}
