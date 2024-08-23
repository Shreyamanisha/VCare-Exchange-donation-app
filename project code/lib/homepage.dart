import 'package:flutter/material.dart';
import 'profilepage.dart';
import 'aboutus.dart';
import 'homepagecontent.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MyHomePageContent(),
    AboutUsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'VCare Exchange',
            style: TextStyle(
              fontFamily: 'LeagueGothic',
              fontSize: 40.0,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.teal.shade600,
      ),
      body: Container(
        color: Colors.teal.shade600,
        child: Expanded(
          child: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 28.0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              size: 28.0,
            ),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 28.0,
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.teal.shade600,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }
}
