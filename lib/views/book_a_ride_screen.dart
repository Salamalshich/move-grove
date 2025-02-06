import 'package:flutter/material.dart';
import '../Controller/trip_controller.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final List<String> provinces = ['Damascus', 'Latakia','Hasaka','Idlib','Homs','Quneitra','daraa',' rif dimashq','suwayda','al kamshlie','aleppo','tartus','hama','raqqa','hasakah','dei alzor'];
  String? selectedProvinceFrom;
  String? selectedProvinceTo;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final TextEditingController notesController = TextEditingController();
  final TextEditingController seatsController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final TripController _controller = TripController();

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

  String get formattedDate {
    if (selectedDate == null) return 'Select Date';
    return '${selectedDate!.year}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}';
  }

  String get formattedTime {
    if (selectedTime == null) return 'Select Time';
    return '${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}';
  }

  void _createTrip() {
    if (selectedProvinceFrom == null ||
        selectedProvinceTo == null ||
        selectedDate == null ||
        selectedTime == null ||
        notesController.text.isEmpty ||
        seatsController.text.isEmpty ||
        priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    print('hhhhhhhhhhhhhhhhhhhh');
    _controller.createTrip(
        context: context,
        source_id: selectedProvinceFrom.toString(),
        destination_id: selectedProvinceTo.toString(),
        dateTime: selectedDate.toString(),
        total_seats: seatsController.text.toString(),
        price: priceController.text.toString(),
        notes: notesController.text.toString()

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Create a Trip'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFCDB9B0), // لون فاتح
              Color(0xFFAEB4BC), // لون داكن
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  value: selectedProvinceFrom,
                  items: provinces
                      .map((province) => DropdownMenuItem<String>(
                    value: province,
                    child: Text(province),
                  ))
                      .toList(),
                  onChanged: (value) =>
                      setState(() => selectedProvinceFrom = value),
                  decoration: InputDecoration(
                    labelText: 'From',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedProvinceTo,
                  items: provinces
                      .map((province) => DropdownMenuItem<String>(
                    value: province,
                    child: Text(province),
                  ))
                      .toList(),
                  onChanged: (value) =>
                      setState(() => selectedProvinceTo = value),
                  decoration: InputDecoration(
                    labelText: 'To',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: TextEditingController(text: formattedDate),
                      decoration: InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => _selectTime(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: TextEditingController(text: formattedTime),
                      decoration: InputDecoration(
                        labelText: 'Time',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: seatsController,
                  decoration: InputDecoration(
                    labelText: 'Total Seats',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: notesController,
                  decoration: InputDecoration(
                    labelText: 'Notes',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _createTrip,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: const Text('Create Trip'),
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