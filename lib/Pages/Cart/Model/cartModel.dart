import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Global/Response/product.dart';

class Cart with ChangeNotifier {
  bool isCreate = true;
  List<Product> products = [];
  double _price = 0.0;
  void add(Product item) {
    products.add(item);
    _price += item.price;
    isCreate = false;
    notifyListeners();
  }

  void remove(Product item) {
    products.remove(item);
    _price -= item.price;
    notifyListeners();
  }

  int get count {
    return products.length;
  }

  double get totalPrice {
    return _price;
  }

  List<Product> get bascketItems {
    return products;
  }

  void removeAll() {
    products.clear();
    notifyListeners();
  }
}
