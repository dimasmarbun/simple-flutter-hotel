import 'package:flutter/material.dart';
import 'package:flutter_application_3/providers/place_provider.dart';
import 'package:flutter_application_3/models/place_model.dart';
import '../screens/detailroom.dart';
import 'package:provider/provider.dart';

class MySearch extends StatefulWidget {
  const MySearch({Key? key}) : super(key: key);

  @override
  _MySearchState createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.lightBlue[700]),
        ),
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by name or category',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: Consumer<PlaceProvider>(
                builder: (context, placeProvider, child) {
                  List<Place> searchResults =
                      placeProvider.searchPlaces(_searchText);
                  return ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(
                          searchResults[index].image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(searchResults[index].name),
                        subtitle: Text(searchResults[index].type),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(place: searchResults[index]),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
