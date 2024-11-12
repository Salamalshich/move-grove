import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor:const Color.fromRGBO(148, 118, 107, 1),
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/Pictures/taxi.jpg'), // Path to your image
                fit: BoxFit.cover, // Cover the entire screen
                scale: 1.5, // Zoom into the image (1.5x zoom)
              ),
            ),
          ),
          // Dark overlay with increased opacity
          Container(
            color: const Color.fromARGB(255, 72, 70, 70).withOpacity(0.2), // Adjust the opacity here
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Email Field
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email, color: Colors.black), // Email Icon
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.1), // Darker background
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 2.0), // Bold focused border
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 2.0), // Bold enabled border
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20), // Spacing between fields
                // Phone Number Field
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone, color: Colors.black), // Phone Icon
                    labelText: 'Phone Number',
                    labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.1), // Darker background
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 2.0), // Bold focused border
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 2.0), // Bold enabled border
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 20), // Spacing between fields
                // Password Field
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.black), // Password Icon
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.1), // Darker background
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 2.0), // Bold focused border
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 2.0), // Bold enabled border
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true, // For hiding password input
                ),
                const SizedBox(height: 40), // Spacing before login button
                // Login Button
                ElevatedButton(
                  onPressed: () {
                    // Add login logic here
                    Get.snackbar("Login", "Logged in successfully!");
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent, // Text color
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 100),
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
