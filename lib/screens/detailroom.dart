import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/place_model.dart';
import 'package:flutter_application_3/providers/order_provider.dart';

import 'package:provider/provider.dart';

import 'package:flutter_application_3/providers/wishlist_provider.dart';

class DetailPage extends StatefulWidget {
  final Place place;

  const DetailPage({required this.place});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        foregroundColor: Colors.lightBlue[700],
        backgroundColor: Colors.lightBlue[100],
        title: Text(
          widget.place.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.lightBlue[700],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Image.network(
              widget.place.image,
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            // Details
            Text(
              'Type: ${widget.place.type}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rating: ${widget.place.rating}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Price: Rp.${widget.place.price}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Facilities
            Text(
              'Facilities:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.place.facilities.map((facility) {
                return Text('- $facility');
              }).toList(),
            ),
            SizedBox(height: 20),
            // Action buttons (Wishlist & Take Order)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Provider.of<WishlistProvider>(context, listen: false)
                        .addToWishlist(widget.place);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${widget.place.name} added to wishlist'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text(
                    'Add to Wishlist',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.lightBlue[700],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<OrdersProvider>(context, listen: false)
                        .addToOrders(widget.place);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Order placed for ${widget.place.name}'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text(
                    'Take Order',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.lightBlue[700],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
