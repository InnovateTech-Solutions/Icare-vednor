import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyMapScreen(),
    );
  }
}

class MyMapScreen extends StatefulWidget {
  @override
  _MyMapScreenState createState() => _MyMapScreenState();
}

class _MyMapScreenState extends State<MyMapScreen> {
  final double latitude = 37.7749; // Replace with your desired latitude
  final double longitude = -122.4194; // Replace with your desired longitude

  String address = "Loading...";

  @override
  void initState() {
    super.initState();
    getAddressFromCoordinates();
  }

  Future<void> getAddressFromCoordinates() async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        setState(() {
          address =
              "${placemark.street}, ${placemark.locality}, ${placemark.country}";
        });
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Coordinates: $latitude, $longitude",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              "Address: $address",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
