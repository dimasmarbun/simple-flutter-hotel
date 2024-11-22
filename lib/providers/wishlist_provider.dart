import 'package:flutter/foundation.dart';
import 'package:flutter_application_3/models/place_model.dart';

class WishlistProvider with ChangeNotifier {
  final List<Place> _wishlist = [];

  List<Place> get wishlist => _wishlist;

  void addToWishlist(Place place) {
    _wishlist.add(place);
    notifyListeners();
  }

  void removeFromWishlist(Place place) {
    _wishlist.remove(place);
    notifyListeners();
  }
}
