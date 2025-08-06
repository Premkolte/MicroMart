import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_model.dart'; // Import CartItem

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  double _totalCost = 0.0;

  List<CartItem> get items => _items;
  double get totalCost => _totalCost;

  // Load cart items from SharedPreferences
  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? cartItemsData = prefs.getStringList('cartItems');

    if (cartItemsData != null) {
      _items.addAll(cartItemsData.map((item) => CartItem.fromJson(jsonDecode(item))).toList());
      _calculateTotalCost();
    }
    notifyListeners();
  }

  // Add an item to the cart
  Future<void> addToCart(CartItem item) async {
    _items.add(item);
    _totalCost += double.parse(item.price);
    await saveCart();
    notifyListeners();
  }

  // Remove an item from the cart
  Future<void> removeFromCart(int index) async {
    // Deduct the price of the removed item from totalCost
    _totalCost -= double.parse(_items[index].price);
    _items.removeAt(index);
    await saveCart();
    notifyListeners();
  }

  // Clear the cart
  Future<void> clearCart() async {
    _items.clear();
    _totalCost = 0.0;
    await saveCart();
    notifyListeners();
  }

  // Save cart items to SharedPreferences
  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();

    // Convert each CartItem to a JSON string and store it in SharedPreferences
    List<String> cartItemsData = _items.map((item) => jsonEncode(item.toJson())).toList();

    await prefs.setStringList('cartItems', cartItemsData);
  }

  // Calculate total cost of items in the cart
  void _calculateTotalCost() {
    _totalCost = _items.fold(0.0, (total, item) => total + double.parse(item.price));
  }
}