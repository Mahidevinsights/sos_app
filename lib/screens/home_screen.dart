import 'package:flutter/material.dart';
import 'package:sos_app/screens/home_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of widget screens for navigation
  final List<Widget> _screens = [
    HomeContent(),
    const Center(child: Text('Notes Screen', style: TextStyle(fontSize: 24))),
    const Center(
        child: Text('Appointments Screen', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Profile Screen', style: TextStyle(fontSize: 24))),
  ];

  // Method to handle tap on bottom navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Define your custom color
  final Color customPurple = const Color(0xFF5F57EA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(''),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Kartik',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Let's see your heart's streak today",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: _screens[_selectedIndex], // Display the current screen

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed bottom bar, no shifting
        currentIndex: _selectedIndex, // Current selected index
        onTap: _onItemTapped, // Handle tap on items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_outlined),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.greenAccent, // Selected item color
        unselectedItemColor: Colors.grey, // Unselected item color
      ),
    );
  }
}
