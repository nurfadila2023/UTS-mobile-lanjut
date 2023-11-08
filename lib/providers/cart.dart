import 'dart:collection';
import '../models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_provider/models/cart_item.dart';

class Cart with ChangeNotifier {
  late Map<String, CartItem>
      _items; //menggabungkan jet dan tipe data dalam satu kelompok
  Map<String, CartItem> get items => _items;

  void addCart(String? productId, String? title, double? price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId!,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              quantity: value.quantity! + 1));
// ketika sudah tersedia productId di cart
    } else {
      //ProductId baru
      _items.putIfAbsent(
        productId!,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }
}
