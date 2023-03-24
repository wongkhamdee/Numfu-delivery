import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<List<Map<String, dynamic>>> fetchRestaurants() async {
  final response = await http.get(Uri.parse(
      'https://ac47-223-24-153-125.ap.ngrok.io/api_numfu/Apiget.php'));
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return List<Map<String, dynamic>>.from(jsonData);
  } else {
    throw Exception('Failed to load restaurants');
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant List'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchRestaurants(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final restaurants = snapshot.data!;
            return ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return ListTile(
                  title: Text(restaurant['res_name']),
                  subtitle: Text(restaurant['owner_name']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantDetailScreen(
                          restaurant: restaurant,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class RestaurantDetailScreen extends StatelessWidget {
  final Map<String, dynamic> restaurant;

  const RestaurantDetailScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant['res_name']),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Restaurant Name: ${restaurant['res_name']}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Owner Name: ${restaurant['owner_name']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Phone Number: ${restaurant['phone_number']}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
