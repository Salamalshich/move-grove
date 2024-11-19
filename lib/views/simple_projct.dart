import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // شريط القصص
          SizedBox(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // عدد القصص
              itemBuilder: (context, index) {
                return Container(
                  width: 70.0,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.grey,
                      ),
                      const SizedBox(height: 5.0),
                      Text('User $index'),
                    ],
                  ),
                );
              },
            ),
          ),
          // محتوى الصفحة الرئيسي (يمكنك إضافة المزيد هنا)
          const Expanded(
            child: Center(
              child: Text('Feed Content Here'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
