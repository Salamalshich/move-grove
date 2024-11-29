import 'package:flutter/material.dart';
import 'book_a_ride_screen.dart'; // Ensure this file exists and contains the BookARideScreen class.

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  final List<Map<String, dynamic>> trips = [
    {
      'from': 'Damascus',
      'to': 'Aleppo',
      'price': '\$20',
      'date': '2024-11-20',
      'car': {
        'type': 'Hyundai',
        'license': '5678-910',
        'color': 'Blue',
      },
      'driver': {
        'name': 'Sara Ahmed',
        'phone': '+963987654321',
        'image': 'assets/driver1.png',
      },
    },
    {
      'from': 'Homs',
      'to': 'Latakia',
      'price': '\$15',
      'date': '2024-11-21',
      'car': {
        'type': 'Kia',
        'license': '1234-567',
        'color': 'Red',
      },
      'driver': {
        'name': 'John Doe',
        'phone': '+963123456789',
        'image': 'assets/driver2.png',
      },
    },
  ];

  int? tappedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Trips'),
        backgroundColor: Colors.brown,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: trips.length,
              itemBuilder: (context, index) {
                final trip = trips[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      tappedIndex = tappedIndex == index ? null : index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From: ${trip['from']} - To: ${trip['to']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Price: ${trip['price']}'),
                        if (tappedIndex == index) ...[
                          const SizedBox(height: 8),
                          Text('Date: ${trip['date']}'),
                          const SizedBox(height: 8),
                          Text('Car Type: ${trip['car']['type']}'),
                          Text('Car License: ${trip['car']['license']}'),
                          Text('Car Color: ${trip['car']['color']}'),
                          const SizedBox(height: 8),
                          Text('Driver: ${trip['driver']['name']}'),
                          Text('Phone: ${trip['driver']['phone']}'),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocationScreen(), // Ensure the class name is correct
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
              ),
              child: const Text('Add my Trip'),
            ),
          ),
        ],
      ),
    );
  }
}
