import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp_view.dart';

class AccountTypeView extends StatelessWidget {
  const AccountTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Number'),
        backgroundColor: Colors.brown,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/Pictures/taxi.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Phone number input with country picker
                
                  const SizedBox(height: 20), // Spacing
                  // Login button
                  ElevatedButton(
                    onPressed: () {
                      // Direct navigation to OTP screen
                      Get.to(() => const OTPView());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text('Login'),
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