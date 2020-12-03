import 'package:e_solve/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    final product = Provider.of<Product>(context, listen: false);

    return GestureDetector(
      onTap: () {},
      child: Container(
        child: ClipRRect(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
            child: GridTile(
              child: Hero(
                tag: product.id,
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/deer.png'),
                  image: NetworkImage(
                    product.image,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
              footer: GridTileBar(
                trailing: Text('\$ ${product.price}'),
                backgroundColor: Colors.white,
                title: Text(
                  product.name,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
