import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/detailroom.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_3/providers/order_provider.dart';
import 'package:flutter_application_3/models/place_model.dart';

class MyOrders extends StatefulWidget {
  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text(
          'My Orders',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.lightBlue[700]),
        ),
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Consumer<OrdersProvider>(
        builder: (context, ordersProvider, child) {
          return ListView.builder(
            itemCount: ordersProvider.orders.length,
            itemBuilder: (context, index) {
              Place place = ordersProvider.orders[index];
              return ListTile(
                leading: Image.network(
                  place.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(place.name),
                subtitle: Text(place.type),
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
