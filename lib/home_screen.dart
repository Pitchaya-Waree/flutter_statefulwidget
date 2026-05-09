import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Attraction {
  final int id;
  final String name;
  final String detail;
  final String coverImage;
  final double latitude;
  final double longitude;
  final int rating; // Added for assignment

  Attraction({
    required this.id,
    required this.name,
    required this.detail,
    required this.coverImage,
    required this.latitude,
    required this.longitude,
    required this.rating, // Added for assignment
  });

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      id: json['id'],
      name: json['name'],
      detail: json['detail'],
      coverImage: json['coverimage'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      rating:
          json['rating'] ??
          0, // Added for assignment, default to 0 if not present
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeScreen> {
  List<Attraction> attractions = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString(
      'assets/attractions.json',
    );
    final data = await json.decode(response);

    setState(() {
      attractions = List<Attraction>.from(
        data.map((i) => Attraction.fromJson(i)),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: attractions.length,
        itemBuilder: (context, i) {
          // Temporarily resolve the issue by using a CORS proxy
          final imageUrl =
              'https://api.allorigins.win/raw?url=${attractions[i].coverImage}';

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(imageUrl),
                  const SizedBox(height: 8),
                  Text(
                    attractions[i].name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(attractions[i].detail),
                  const SizedBox(height: 8),
                  // Added Lat, Lng, and Rating for Assignment
                  Text(
                    'Latitude: ${attractions[i].latitude}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Longitude: ${attractions[i].longitude}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Rating: ${attractions[i].rating} / 5',
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
