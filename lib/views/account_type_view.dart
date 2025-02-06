import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../Controller/otp_controller.dart';
import 'otp_view.dart';

class AccountTypeView extends StatelessWidget {
   AccountTypeView({super.key});
   TextEditingController phonenumbercontroller= TextEditingController();

  final OtpController _controller = OtpController();
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
                  IntlPhoneField(
                                    controller: phonenumbercontroller,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your phone number',
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.9),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    initialCountryCode: 'SA', // Set your default country code
                  ),
                  const SizedBox(height: 20), // Spacing
                  // Login button
                  ElevatedButton(
                                    onPressed: () {
                   if(phonenumbercontroller.text.isNotEmpty) {
                                     _controller.generateOTP(context: context,
                                         phonenumber: phonenumbercontroller.text);
                                     // Direct navigation to OTP screen
                                     Get.to(() =>  OTPView());
                   }

                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    child: const Text('Login'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}