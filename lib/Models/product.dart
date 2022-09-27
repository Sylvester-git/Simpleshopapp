import 'package:flutter/material.dart';

class product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageurl;
  bool isfavorite;

  product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageurl,
    required this.price,
    this.isfavorite = false,
  });

  void togglefavorite() {
    isfavorite = !isfavorite;
    //this kind of like setstate.
    notifyListeners();
  }
}
