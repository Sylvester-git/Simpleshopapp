import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/products_provider.dart';

class ProductDetailscreen extends StatelessWidget {
  static const routename = '/product_detail_page';
  @override
  Widget build(BuildContext context) {
    final productid = ModalRoute.of(context)!.settings.arguments as String;
    final productdetail = Provider.of<Products>(
      context,
      //setting the listen to false will make  this screen not to change if the
      //main provider in the main file is updated.
      listen: false,
    ).findbyId(productid);

    return Scaffold(
      appBar: AppBar(
        title: Text(productdetail.title),
      ),
    );
  }
}
