import 'package:flutter/material.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  // List to track which trip box is expanded
  final List<bool> _isExpanded = [];

  @override
  void initState() {
    super.initState();
    _isExpanded.addAll(List.generate(4, (_) => false)); // Initialize expansion states
  }

  @override
  Widget build(BuildContext context) {
    // Sample trip data
    final List<Map<String, dynamic>> trips = [
      {
        'from': 'Damascus',
        'to': 'Aleppo',
        'price': '\$20',
        'date': '2024-11-20',
        'car': {
          'type': 'Toyota',
          'license': '1234-567',
          'color': 'White',
        },
        'driver': {
          'name': 'Ahmed Ali',
          'phone': '+963912345678',
          'image': 'https://via.placeholder.com/150',
        }
      },
      {
        'from': 'Homs',
        'to': 'Latakia',
        'price': '\$15',
        'date': '2024-11-21',
        'car': {
          'type': 'Hyundai',
          'license': '5678-910',
          'color': 'Blue',
        },
        'driver': {
          'name': 'Sara Ahmed',
          'phone': '+963987654321',
          'image': 'https://via.placeholder.com/150',
        }
      },
      {
        'from': 'Hama',
        'to': 'Tartus',
        'price': '\$10',
        'date': '2024-11-22',
        'car': {
          'type': 'Kia',
          'license': '1122-334',
          'color': 'Black',
        },
        'driver': {
          'name': 'Hassan Khaled',
          'phone': '+963954321987',
          'image': 'https://via.placeholder.com/150',
        }
      },
      {
        'from': 'Raqqa',
        'to': 'Deir ez-Zor',
        'price': '\$25',
        'date': '2024-11-23',
        'car': {
          'type': 'Ford',
          'license': '4455-667',
          'color': 'Red',
        },
        'driver': {
          'name': 'Omar Khalid',
          'phone': '+963956789123',
          'image': 'https://via.placeholder.com/150',
        }
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Trips'),
        backgroundColor: const Color.fromRGBO(148, 118, 107, 1),
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/Pictures/taxi.jpg'),
                fit: BoxFit.cover,
                scale: 1.5,
              ),
            ),
          ),
          // Dark overlay with increased opacity
          Container(
            color: const Color.fromARGB(255, 72, 70, 70).withOpacity(0.2),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: trips.length,
              itemBuilder: (context, index) {
                final trip = trips[index];
                final isExpanded = _isExpanded[index];

                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded[index] = !_isExpanded[index];
                        });
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'From: ${trip['from']}',
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'To: ${trip['to']}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Price: ${trip['price']}',
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (isExpanded)
                      Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                    NetworkImage(trip['driver']['image']),
                                    radius: 50,
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        trip['driver']['name'],
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        'From: ${trip['from']} to ${trip['to']}',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        'Date: ${trip['date']}',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Row(
                                children: [
                                  const Icon(Icons.directions_car, size: 28),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Car: ${trip['car']['type']}',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  const Icon(Icons.color_lens, size: 28),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Color: ${trip['car']['color']}',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  const Icon(Icons.confirmation_num, size: 28),
                                  const SizedBox(width: 12),
                                  Text(
                                    'License: ${trip['car']['license']}',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Row(
                                children: [
                                  const Icon(Icons.phone, size: 28),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Phone: ${trip['driver']['phone']}',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

