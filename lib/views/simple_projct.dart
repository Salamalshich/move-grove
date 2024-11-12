import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // شريط القصص
          Container(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // عدد القصص
              itemBuilder: (context, index) {
                return Container(
                  width: 70.0,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(height: 5.0),
                      Text('User $index'),
                    ],
                  ),
                );
              },
            ),
          ),
          // محتوى الصفحة الرئيسي (يمكنك إضافة المزيد هنا)
          Expanded(
            child: Center(
              child: Text('Feed Content Here'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
