import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_view.dart';
import 'passenger_login_view.dart';

class AccountTypeView extends StatelessWidget {
  const AccountTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Type'),
        backgroundColor: const Color.fromRGBO(148, 118, 107, 1),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/Pictures/logo.jpg'), // Path to your logo image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => const LoginView());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      textStyle: const TextStyle(fontSize: 24),
                    ),
                    child: const Text('Driver'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => const PassengerLoginView()); // Navigate to PassengerLoginView
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      textStyle: const TextStyle(fontSize: 24),
                    ),
                    child: const Text('Passenger'),
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
