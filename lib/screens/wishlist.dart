import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/detailroom.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_3/providers/wishlist_provider.dart';
import 'package:flutter_application_3/models/place_model.dart';

class MyWishlist extends StatefulWidget {
  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.lightBlue[700]),
        ),
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Consumer<WishlistProvider>(
        builder: (context, wishlistProvider, child) {
          return ListView.builder(
            itemCount: wishlistProvider.wishlist.length,
            itemBuilder: (context, index) {
              Place place = wishlistProvider.wishlist[index];
              return ListTile(
                leading: Image.network(
                  place.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(place.name),
                subtitle: Text(place.type),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    Provider.of<WishlistProvider>(context, listen: false)
                        .removeFromWishlist(place);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${place.name} removed from wishlist'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(place: place),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
