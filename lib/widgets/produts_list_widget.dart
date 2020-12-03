import 'package:e_solve/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    final product = Provider.of<Product>(context, listen: false);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 350,
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
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Text(
                    product.name,
                    textAlign: TextAlign.start,
                    softWrap: true,
                    maxLines: 4,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
