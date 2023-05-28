import 'package:flutter/material.dart';

import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  productExist(ProductModel product) {
    if (_carts.indexWhere((element) => element.product!.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  addCart(ProductModel product) {
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product!.id == product.id);
      _carts[index].quantity = _carts[index].quantity! + 1;
    } else {
      _carts.add(CartModel(
        id: _carts.length,
        product: product,
        quantity: 1,
      ));
    }
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity = _carts[id].quantity! + 1;
    notifyListeners();
  }

  subQuantity(int id) {
    if (_carts[id].quantity! > 1) {
      _carts[id].quantity = _carts[id].quantity! - 1;
      notifyListeners();
    } else {
      removeCart(id);
    }
  }

  totalItems() {
    int total = 0;
    _carts.forEach((element) {
      total += element.quantity!;
    });
    return total;
  }

  totalPrice() {
    double total = 0;
    _carts.forEach((element) {
      total += element.product!.price! * element.quantity!;
    });
    return total;
  }
}
