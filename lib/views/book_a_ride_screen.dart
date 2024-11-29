import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final List<String> provinces = [
    'Damascus',
    'Latakia',
  ];

  String? selectedProvinceFrom;
  String? selectedProvinceTo;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // Dio instance
  final Dio _dio = Dio();

  // Function to open the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? currentDate,
      firstDate: currentDate,
      lastDate: DateTime(currentDate.year + 1),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Function to open the time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay currentTime = TimeOfDay.now();
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? currentTime,
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  // Format the DateTime object to string
  String get formattedDate {
    if (selectedDate == null) return 'Select Date';
    return '${selectedDate!.year}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}';
  }

  // Format the TimeOfDay object to string
  String get formattedTime {
    if (selectedTime == null) return 'Select Time';
    return '${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}';
  }

  // API Call Function
  Future<void> _createTrip() async {
    if (selectedProvinceFrom == null ||
        selectedProvinceTo == null ||
        selectedDate == null ||
        selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields before creating a trip.'),
        ),
      );
      return;
    }

    try {
      final response = await _dio.post(
        'http://movo-app.test/api/add-trip',
        data: {
          'from': selectedProvinceFrom,
          'to': selectedProvinceTo,
          'date': formattedDate,
          'time': formattedTime,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Trip created successfully!'),
          ),
        );
        Navigator.pop(context); // Go back after successful creation
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to create trip. Please try again.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Locations'),
        backgroundColor: const Color.fromRGBO(148, 118, 107, 1),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Create a Trip",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),

                // From Dropdown
                DropdownButtonFormField<String>(
                  value: selectedProvinceFrom,
                  items: provinces
                      .map((province) => DropdownMenuItem<String>(
                    value: province,
                    child: Text(province),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedProvinceFrom = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Your Location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 20),

                // To Dropdown
                DropdownButtonFormField<String>(
                  value: selectedProvinceTo,
                  items: provinces
                      .map((province) => DropdownMenuItem<String>(
                    value: province,
                    child: Text(province),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedProvinceTo = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Your Destination',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 20),

                // Date Picker
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: TextEditingController(text: formattedDate),
                      decoration: InputDecoration(
                        labelText: 'Select Date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Time Picker
                GestureDetector(
                  onTap: () => _selectTime(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: TextEditingController(text: formattedTime),
                      decoration: InputDecoration(
                        labelText: 'Select Time',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Create Trip Button
                ElevatedButton(
                  onPressed: _createTrip,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 32,
                    ),
                  ),
                  child: const Text(
                    "Create Trip",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
