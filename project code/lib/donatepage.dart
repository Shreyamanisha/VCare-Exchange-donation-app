import 'package:flutter/material.dart';
//import 'package:trying/track.dart';
import 'clothesdonation.dart';
import 'fooddonation.dart';
//import 'geoloc.dart';
//import 'geoloc.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade600,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade600,
        title: Text(
          'Home',
          style: TextStyle(
            fontFamily: 'LeagueGothic',
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Turn surplus into support! Instead of discarding, share your excess with those in need, transforming unused into invaluable help.',
                style: TextStyle(
                  fontFamily: 'Imit',
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Image.asset(
            'assets/food1.jpg', // Replace with the path to your first image
            height: 200.0,
            width: 200.0,
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              // Add your logic for the 'Food' button here
              Navigator.push(context, MaterialPageRoute(builder: (context) => FoodMap1()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: Text(
              'Food',
              style: TextStyle(
                fontFamily: 'LeagueGothic',
                fontSize: 25.0,
                color: Colors.teal.shade900,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Image.asset(
            'assets/donation.jpg', // Replace with the path to your second image
            height: 200.0,
            width: 200.0,
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              // Add your logic for the 'Clothes' button here
              Navigator.push(context, MaterialPageRoute(builder: (context) => ClothesMap1()));

            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: Text(
              'Clothes',
              style: TextStyle(
                fontFamily: 'LeagueGothic',
                fontSize: 25.0,
                color: Colors.teal.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

