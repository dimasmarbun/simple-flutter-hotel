import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/home.dart';
import 'package:flutter_application_3/screens/orders.dart';
import 'package:flutter_application_3/screens/search.dart';
import 'package:flutter_application_3/screens/wishlist.dart';

class MyDefaultFrame extends StatefulWidget {
  const MyDefaultFrame({super.key});

  @override
  State<MyDefaultFrame> createState() => _MyhomeState();
}

class _MyhomeState extends State<MyDefaultFrame> {
  int _selected = 0;
  void _onTap(int index) {
    setState(() {
      _selected = index;
    });
  }

  Widget changePage(int index) {
    if (index == 0) {
      return MyHome();
    } else if (index == 1) {
      return MySearch();
    } else if (index == 2) {
      return MyWishlist();
    } else if (index == 3) {
      return MyOrders();
    } else {
      return MyHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: changePage(_selected),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightBlue[700],
        unselectedItemColor: Colors.grey[500],
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        elevation: 20,
        iconSize: 30,
        onTap: _onTap,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selected,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.lightBlue[100],
            icon: Icon(Icons.apartment_rounded),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.lightBlue[100],
            icon: Icon(Icons.search_rounded),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.lightBlue[100],
            icon: Icon(Icons.favorite_rounded),
            label: 'WISHLIST',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.lightBlue[100],
            icon: Icon(Icons.cases_rounded),
            label: 'MY ORDERS',
          ),
        ],
      ),
    );
  }
}
