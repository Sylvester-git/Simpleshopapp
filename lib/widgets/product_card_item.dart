import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/product.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  /* final String imageurl;
  final String id;
  final String title;

  ProductItem(this.id, this.imageurl, this.title);
*/
  @override
  Widget build(BuildContext context) {
    //Another appproach to  Provider.of<product>( context,); is wrapping the whole widget in a Consumer widget.
    //Supported by the provider package.
    //The advantage of consumer is that you can still listen to main provider even if the provider in this screen listen is
    //set to false.

    //The function of the child in the consumer is to make it that a widget wrapped in the comsumer is always
    //constant.

    final products = Provider.of<product>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: Consumer<product>(
            builder: (context, value, child) => IconButton(
              icon: Icon(
                products.isfavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.amber[700],
              ),
              onPressed: () {
                products.togglefavorite();
              },
            ),
          ),
          backgroundColor: Colors.black87,
          title: Text(
            products.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_bag_rounded,
              color: Colors.amber[700],
            ),
            onPressed: null,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailscreen.routename,
              arguments: products.id,
            );
          },
          child: Image.network(
            products.imageurl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
