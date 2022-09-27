import 'package:flutter/material.dart';
import '../Models/products_provider.dart';
import '../widgets/product_card_item.dart';

import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  final bool showfav;

  ProductGrid(this.showfav);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products =
        showfav ? productData.showFavoritesOnly : productData.productItems;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) {
        //Using ChangeNotifierProvider.value is the correct approcach for grid or list with multiple
        //widgets but for the just changing a single widget, it is better to just use ChangeNotifierProvider
        return ChangeNotifierProvider.value(
          //Note that  changenofifier automatically cleans the data when not in use to avoid memory leaks.
          value: products[index],
          child: ProductItem(
              // products[index].id,
              // products[index].imageurl,
              //products[index].title,
              ),
        );
      },
      itemCount: products.length,
    );
  }
}
