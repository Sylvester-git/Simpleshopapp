import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/product.dart';
import '../Models/products_provider.dart';
import '../widgets/product_grid.dart';

enum filterOptions {
  Favorites,
  ShowAll,
}

class Product_overview_screen extends StatefulWidget {
  @override
  State<Product_overview_screen> createState() =>
      _Product_overview_screenState();
}

class _Product_overview_screenState extends State<Product_overview_screen> {
  var _showFavOnly = false;

  @override
  Widget build(BuildContext context) {
    final productdata = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Shoplus'),
        actions: [
          PopupMenuButton(
              onSelected: (filterOptions selectedvalue) {
                setState(() {
                  if (selectedvalue == filterOptions.Favorites) {
                    _showFavOnly = true;
                  } else {
                    _showFavOnly = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Favorite'),
                      value: filterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text('Show all'),
                      value: filterOptions.ShowAll,
                    ),
                  ])
        ],
      ),
      body: ProductGrid(_showFavOnly),
    );
  }
}
