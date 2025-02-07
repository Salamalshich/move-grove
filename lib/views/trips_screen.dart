import 'package:flutter/material.dart';
import 'package:untitled10/Controller/trip_controller.dart';
import 'book_a_ride_screen.dart'; // Ensure this file exists and contains the BookARideScreen class.
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  final TripController tripController = TripController();
  int? tappedIndex;
  bool isLoading = true; // Track loading state
  String? errorMessage; // Track error messages
//  .....................................
  @override
  void initState() {
    super.initState();
    loadTrips(); // Fetch trips when the widget is created
  }

  // Function to fetch trips
  Future<void> loadTrips() async {
    try {
      await tripController.getTrips(context: context);
      setState(() {
        isLoading = false; // Data has been loaded
      });
    } catch (e) {
      setState(() {
        isLoading = false; // Stop loading
        errorMessage = 'Failed to load trips: $e'; // Set error message
      });
    }
  }
  double _rating = 0.0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Trips'),
        backgroundColor: Colors.brown,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){loadTrips();}, icon: Center(
            child: Icon(Icons.refresh),
          ))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFCDB9B0),
              Color(0xFFAEB4BC),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            if (isLoading)
              const Center(child: CircularProgressIndicator()) // Show loader while loading
            else if (errorMessage != null)
              Center(child: Text(errorMessage!)) // Show error message if any
            else
              Expanded(
                child: ListView.builder(
                  itemCount: tripController.responseData.length,
                  itemBuilder: (context, index) {
                    final trip = tripController.responseData[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          tappedIndex = tappedIndex == index ? null : index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'From: ${trip['source']}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text('To: ${trip['destination']}'),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Price: ${trip['price']}',
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text('Date: ${trip['dateTime']}'),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey.shade300,
                                  child: const Icon(Icons.person, color: Colors.brown),
                                  radius: 30,
                                ),
                              ],
                            ),
                            if (tappedIndex == index) ...[
                              const Divider(height: 20, thickness: 1),
                              const SizedBox(height: 10),
                              ElevatedButton.icon(
                                onPressed: () {
                                  tripController.joinTrip(
                                    context: context,
                                    trip_id: trip['id'],
                                    source_id: 1,
                                    destination_id: 2,
                                    
                                  );
                                  showBottomSheet(
                                    backgroundColor: Colors.white,
                                    constraints: BoxConstraints(

                                      maxHeight: MediaQuery.sizeOf(context).height/3
                                    ),
                                    context: context, builder: (context) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text('Rate this Trip:',style: TextStyle(fontSize: 17),),
                                      ),
                                      SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          RatingBar.builder(
                                            initialRating: 0,  // تعيين القيمة الابتدائية
                                            minRating: 1,  // الحد الأدنى للتقييم
                                            itemSize: 40,  // حجم النجوم
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,  // السماح بتقييم نصف النجمة
                                            itemCount: 5,  // عدد النجوم
                                            itemBuilder: (context, index) => Icon(
                                              Icons.star,
                                              color: index < _rating ? Colors.yellow : Colors.grey,
                                            ),
                                            onRatingUpdate: (rating) {
                                              setState(() {
                                                _rating = rating;
                                                tripController.ratingTrip(context: context, trip_id: trip['id'], user_id: 1, rating: _rating);// تحديث قيمة التقييم
                                              });
                                            },
                                          ),

                                        ],
                                      )
                                    ],
                                  ),);
                                },
                                icon: const Icon(Icons.add, color: Colors.white),
                                label: const Text(
                                  'Join Trip',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LocationScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                ),
                child: const Text('Add my Trip'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}