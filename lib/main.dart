import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../Models/cart_items.dart';
import '../screens/cart_screen.dart';
import 'Models/products_provider.dart';
import './screens/product_detail_screen.dart';
import './screens/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Using ChangeNotifierProvider.value is the correct approcach for grid or list with multiple
    //widgets but for the just changing a single widget, it is better to just use ChangeNotifierProvider

    //A multiprovider simply allows for multiple providers
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
          ).copyWith(secondary: Colors.deepPurple[300]),
        ),
        home: Product_overview_screen(),
        routes: {
          CartScreen.routeName: (context) => CartScreen(),
          ProductDetailscreen.routename: (context) => ProductDetailscreen(),
        },
      ),
    );
  }
}
