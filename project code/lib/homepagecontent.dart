import 'package:flutter/material.dart';

import 'acceptorpage.dart';
import 'donatepage.dart';

class MyHomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bridging hearts, one donation at a time.\nWhether giving or receiving, our app is where compassion meets community.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5.0),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/home3.png',
              height: 400.0,
            ),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HelpPage()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              overlayColor: MaterialStateProperty.all<Color>(Color(0xFF196F3D).withOpacity(0.5)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              minimumSize: MaterialStateProperty.all<Size>(Size(300.0, 60.0)),
            ),
            child: Text(
              'Help Someone in Need',
              style: TextStyle(
                fontFamily: 'LeagueGothic',
                fontSize: 30.0, // Increased font size
                color: Colors.teal.shade800, // Dark green color
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NeedPage()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              overlayColor: MaterialStateProperty.all<Color>(Color(0xFF196F3D).withOpacity(0.5)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              minimumSize: MaterialStateProperty.all<Size>(Size(300.0, 60.0)),
            ),
            child: Text(
              'I Am the One in Need',
              style: TextStyle(
                fontFamily: 'LeagueGothic',
                fontSize: 30.0, // Increased font size
                color: Colors.teal.shade800, // Dark green color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
