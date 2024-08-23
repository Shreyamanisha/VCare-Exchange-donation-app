import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPage('About Us');
  }
}

Widget _buildPage(String content) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        content,
        style: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'LeagueGothic',
          color: Colors.teal.shade900,
        ),
      ),
      backgroundColor: Colors.teal.shade600, // Set your standard green color
    ),
    body: Container(
      color: Colors.teal.shade600, // Set your usual green color
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '♡ Welcome to VCare Exchange- Where Generosity Meets Connection ♡',
                  style: TextStyle(
                    fontSize: 25.0, // Set a larger font size
                    fontWeight: FontWeight.bold, // Set to bold
                    color: Colors.white, // Set text color to white
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Discover a world of compassion at VCare Exchange, where we\'re on a mission to bridge the gap between surplus and need. More than just an app, VCare Exchange is a movement that envisions a community where abundance is shared, and no one faces life\'s challenges in isolation.\n\n'
                      'At VCare Exchange, donors play a crucial role in transforming excess resources into lifelines for those in need. If you find yourself with surplus food, clothing, or essentials, our platform allows you to effortlessly post your donation, ensuring it finds a purpose and brightens someone else\'s life.\n\n'
                      'For our donors, we understand that sometimes connecting with an acceptor may not be immediate. That\'s why we\'ve introduced a unique feature – if you can\'t find an acceptor right away, VCare Exchange provides the option to connect with old age homes or orphanages. Simply deposit your donations there, and acceptors can conveniently collect them later.\n\n'
                      'On the receiving end, VCare Exchange creates a safe space for acceptors to seek help without hesitation. Browse available donations in your local area and connect with donors eager to share. Your needs matter, and we\'re here to support you on your journey.\n\n'
                      'VCare Exchange stands on the pillars of community, empathy, and sustainability. We believe in the strength of community bonds, the transformative power of empathy, and the importance of redirecting surplus resources to those who need them.\n\n'
                      'Whether you\'re here to give or receive, you\'re an essential part of the VCare Exchange family. Join us in creating a community where no one is left behind. Download the app, become a donor, or seek support—because together, we make a meaningful difference.\n\n'
                      'Let\'s build a world where generosity knows no bounds. Join VCare Exchange today!',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white, // Set text color to white
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20.0),
                Image.asset(
                  'assets/joinus1.png', // Replace with the path to your image
                  height: 200.0,
                  width: 200.0,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
