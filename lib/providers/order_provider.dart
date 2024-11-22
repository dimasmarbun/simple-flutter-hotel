import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/place_model.dart';

class OrdersProvider with ChangeNotifier {
  final List<Place> _orders = [];

  List<Place> get orders => _orders;

  void addToOrders(Place place) {
    _orders.add(place);
    notifyListeners();
  }
}
