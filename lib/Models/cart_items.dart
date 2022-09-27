import 'package:flutter/material.dart';

class CartItems {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItems({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  late Map<String, CartItems> _items;

  Map<String, CartItems> get items {
    return {..._items};
  }

  void addnewitem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      //change quantity
      _items.update(
          productId,
          (existingcartitemdata) => CartItems(
              id: existingcartitemdata.id,
              title: existingcartitemdata.title,
              quantity: existingcartitemdata.quantity + 1,
              price: existingcartitemdata.price));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItems(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price),);
    }
  }
}
