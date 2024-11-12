import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'account_type_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 412,
              height: 915,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/Pictures/logo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the Account Type screen
                  Get.to(() => const AccountTypeView());
                },
                child: const Text('Next'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
