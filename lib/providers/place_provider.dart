import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/place_model.dart';

class PlaceProvider with ChangeNotifier {
  final List<Place> _places = [
    // Add sample data here
    Place(
      id: 1,
      image: 'https://picsum.photos/200/300?random=1',
      category: 'room',
      type: 'Standard',
      name: ' Standard Twin Room ',
      facilities: ['WiFi', 'TV', 'AC'],
      rating: 4.5,
      price: 180000.0,
    ),
    Place(
      id: 2,
      image: 'https://picsum.photos/200/300?random=2',
      category: 'room',
      type: 'Standard',
      name: 'Standard Single Bed Room',
      facilities: ['WiFi', 'TV', 'AC'],
      rating: 4.5,
      price: 180000.0,
    ),
    Place(
      id: 3,
      image: 'https://picsum.photos/200/300?random=3',
      category: 'room',
      type: 'Superior',
      name: 'Superior Double  Bed Room',
      facilities: ['WiFi', 'TV', 'AC'],
      rating: 4.5,
      price: 240000.0,
    ),
    Place(
      id: 4,
      image: 'https://picsum.photos/200/300?random=4',
      category: 'room',
      type: 'Superior',
      name: 'Superior Twin Bed Room',
      facilities: ['WiFi', 'TV', 'AC', 'Towel'],
      rating: 4.5,
      price: 240000.0,
    ),
    Place(
      id: 5,
      image: 'https://picsum.photos/200/300?random=5',
      category: 'room',
      type: 'Deluxe',
      name: 'Deluxe Double Bed Room',
      facilities: ['WiFi', 'TV', 'AC', 'Towel', 'Breakfast'],
      rating: 4.5,
      price: 300000.0,
    ),
    Place(
      id: 6,
      image: 'https://picsum.photos/200/300?random=6',
      category: 'room',
      type: 'Deluxe',
      name: 'Deluxe King Bed Room',
      facilities: ['WiFi', 'TV', 'AC', 'Towel', 'Breakfast'],
      rating: 4.5,
      price: 300000.0,
    ),
    Place(
      id: 7,
      image: 'https://picsum.photos/200/300?random=7',
      category: 'room',
      type: 'Suite',
      name: 'Suite Double Bed Room',
      facilities: ['WiFi', 'TV', 'AC', 'Towel', 'Breakfast'],
      rating: 4.5,
      price: 400000.0,
    ),
    Place(
      id: 8,
      image: 'https://picsum.photos/200/300?random=8',
      category: 'room',
      type: 'Suite',
      name: 'Suite King Bed Room',
      facilities: ['WiFi', 'TV', 'AC', 'Towel', 'Breakfast'],
      rating: 4.5,
      price: 400000.0,
    ),
    Place(
      id: 9,
      image: 'https://picsum.photos/200/300?random=9',
      category: 'room',
      type: 'Family',
      name: 'Family Twin Bed Room',
      facilities: ['WiFi', 'TV', 'AC', 'Breakfast'],
      rating: 4.5,
      price: 350000.0,
    ),
    Place(
      id: 10,
      image: 'https://picsum.photos/200/300?random=10',
      category: 'room',
      type: 'Family',
      name: ' Family King Bed Room',
      facilities: ['WiFi', 'TV', 'AC', 'Breakfast'],
      rating: 4.5,
      price: 350000.0,
    ),
    Place(
      id: 11,
      image: 'https://picsum.photos/200/300?random=11',
      category: 'hall',
      type: 'X-Small',
      name: 'Meeting-Room (30)',
      facilities: ['Stage', 'Sound System', 'Lighting'],
      rating: 4.0,
      price: 3000000.0,
    ),
    Place(
      id: 12,
      image: 'https://picsum.photos/200/300?random=12',
      category: 'hall',
      type: 'Small',
      name: 'Hall-Room (200+)',
      facilities: ['Stage', 'Sound System', 'Lighting'],
      rating: 4.0,
      price: 20000000.0,
    ),
    Place(
      id: 13,
      image: 'https://picsum.photos/200/300?random=13',
      category: 'hall',
      type: 'Medium',
      name: 'Hall-Room (500+)',
      facilities: ['Stage', 'Sound System', 'Lighting'],
      rating: 4.0,
      price: 35000000.0,
    ),
    Place(
      id: 14,
      image: 'https://picsum.photos/200/300?random=14',
      category: 'hall',
      type: 'Large',
      name: 'Hall-Room (1000+)',
      facilities: ['Stage', 'Sound System', 'Lighting'],
      rating: 4.0,
      price: 42000000.0,
    ),
    Place(
      id: 15,
      image: 'https://picsum.photos/200/300?random=15',
      category: 'hall',
      type: 'X-Large',
      name: 'Ball-Room (2000+)',
      facilities: ['Stage', 'Sound System', 'Lighting'],
      rating: 75000000.0,
      price: 300.0,
    ),
    // Add more sample data as needed
  ];

  List<Place> get places => _places;

  List<Place> get rooms =>
      _places.where((place) => place.category == 'room').toList();
  List<Place> get halls =>
      _places.where((place) => place.category == 'hall').toList();

  List<Place> searchPlaces(String searchText) {
    searchText = searchText.toLowerCase();
    return _places.where((place) {
      return place.name.toLowerCase().contains(searchText) ||
          place.category.toLowerCase().contains(searchText);
    }).toList();
  }
}
