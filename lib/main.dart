import 'package:flutter/material.dart';
import 'package:flutter_application_3/providers/order_provider.dart';
import 'package:flutter_application_3/providers/place_provider.dart';
import 'package:flutter_application_3/providers/wishlist_provider.dart';
import 'package:flutter_application_3/providers/userprovider.dart';
import 'package:provider/provider.dart';
// import 'package:jamenland/widgets/defaultframe.dart';
import 'package:flutter_application_3/screens/loginpage2.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlaceProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
