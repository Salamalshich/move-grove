import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class PassengerLoginView extends StatelessWidget {
  const PassengerLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passenger Login'),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Phone Number Field
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone, color: Colors.black),
                    labelText: 'Phone Number',
                    labelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.1),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 30),
                // Login Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OtpScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 100),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
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

// OTP Verification Screen with the same background image and overlay
class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Enter the 4-digit OTP code',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  // OTP Input Fields
                  OtpTextField(
                    numberOfFields: 4,
                    borderColor: Colors.black,
                    showFieldAsBox: true,
                    focusedBorderColor: Colors.black,
                    fieldWidth: 60,
                    onCodeChanged: (String code) {
                      // Handle code change
                    },
                    onSubmit: (String verificationCode) {
                      print("OTP Code: $verificationCode");
                    },
                  ),
                  const SizedBox(height: 20),
                  // Button to confirm OTP
                  ElevatedButton(
                    onPressed: () {
                      Get.snackbar("OTP Verification", "OTP Verified Successfully!");
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.lightBlueAccent,
                      padding: const EdgeInsets.symmetric(
                          vertical: 19, horizontal: 100),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Verify OTP'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

