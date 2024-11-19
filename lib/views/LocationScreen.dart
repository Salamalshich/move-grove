import 'package:flutter/material.dart';
import 'TripsScreen.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of cities in Syria for the dropdown
    final List<String> cities = [
      'Damascus',
      'Aleppo',
      'Homs',
      'Latakia',
      'Hama',
      'Deir ez-Zor',
      'Raqqa',
      'Tartus',
      'Idlib',
    ];

    // Variables to store selected cities
    String? selectedCityFrom;
    String? selectedCityTo;

    return Scaffold(
      // No AppBar
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
          // Main content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Ensures the Column is only as large as its children
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Your Location",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white), // Text color adjusted for visibility
                  ),
                  const SizedBox(height: 30),
                  DropdownButtonFormField<String>(
                    value: selectedCityFrom,
                    items: cities
                        .map((city) => DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    ))
                        .toList(),
                    onChanged: (value) {
                      selectedCityFrom = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Select your location',
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Where are you going?",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white), // Text color adjusted for visibility
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: selectedCityTo,
                    items: cities
                        .map((city) => DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    ))
                        .toList(),
                    onChanged: (value) {
                      selectedCityTo = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Select your destination',
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Button at the bottom
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TripsScreen()),
                  );

                },

                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightBlueAccent,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 24),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                icon: const Icon(Icons.arrow_forward), // Button icon
                label: const Text("Sreach "), // Button text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
