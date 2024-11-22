import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_3/providers/place_provider.dart';
import 'package:flutter_application_3/providers/userprovider.dart';
import 'package:provider/provider.dart';
import '../screens/detailroom.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        foregroundColor: Colors.lightBlue[700],
        title: const Text(
          'JM-Land',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'JM-Land',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Provider.of<UserProvider>(context, listen: false).logout();
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            // Carousel Slider Promo
            CarouselSlider(
              options: CarouselOptions(height: 200.0, autoPlay: true),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/promo$i.png'), // Replace with your image name
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Recommendations for rooms
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended Rooms',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue[700]),
                  ),
                  SizedBox(height: 10),
                  Consumer<PlaceProvider>(
                    builder: (context, placeProvider, child) {
                      return Container(
                        height: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: placeProvider.rooms.length,
                          itemBuilder: (context, index) {
                            final place = placeProvider.rooms[index];
                            return GestureDetector(
                              onTap: () {
                                // Navigate to detail page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(place: place),
                                  ),
                                );
                              },
                              child: Card(
                                margin: EdgeInsets.all(8.0),
                                child: Container(
                                  width: 300,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        place.image,
                                        height: 200,
                                        width: 300,
                                        fit: BoxFit.cover,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              place.name,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(place.type),
                                            Row(
                                              children: [
                                                Icon(Icons.star,
                                                    color: Colors.yellow,
                                                    size: 20),
                                                Text('${place.rating}'),
                                              ],
                                            ),
                                            Text('Rp.${place.price}/night'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // Recommendations for halls
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended Halls',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue[700]),
                  ),
                  SizedBox(height: 10),
                  Consumer<PlaceProvider>(
                    builder: (context, placeProvider, child) {
                      return Container(
                        height: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: placeProvider.halls.length,
                          itemBuilder: (context, index) {
                            final place = placeProvider.halls[index];
                            return GestureDetector(
                              onTap: () {
                                // Navigate to detail page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(place: place),
                                  ),
                                );
                              },
                              child: Card(
                                margin: EdgeInsets.all(8.0),
                                child: Container(
                                  width: 300,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        place.image,
                                        height: 200,
                                        width: 300,
                                        fit: BoxFit.cover,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              place.name,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(place.type),
                                            Row(
                                              children: [
                                                Icon(Icons.star,
                                                    color: Colors.yellow,
                                                    size: 20),
                                                Text('${place.rating}'),
                                              ],
                                            ),
                                            Text('Rp.${place.price}/day'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
