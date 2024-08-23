import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Colors.teal.shade600, // Green Color
        ),
        padding: EdgeInsets.fromLTRB(16.0, 80.0, 16.0, 32.0), // Adjusted top padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80.0,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 16.0),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 80.0,
                    color: Colors.transparent, // Set to transparent
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Welcome to VCare Exchange',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'LeagueGothic', // LeagueGothic font
                        fontSize: 40.0, // Increased font size
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 70), // Adjusted space between text and image
            Container(
              height: 250.0,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 16.0), // Adjusted bottom margin
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/apppic1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 70), // Added space between image and buttons

            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(20.0),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                  overlayColor: MaterialStateProperty.all<Color>(
                    Color(0xFF196F3D).withOpacity(0.5),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'LeagueGothic', // LeagueGothic font
                    fontSize: 24.0, // Increased font size
                    color: Colors.teal.shade800, // Darker shade of green
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(20.0),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                  overlayColor: MaterialStateProperty.all<Color>(
                    Color(0xFF196F3D).withOpacity(0.5),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'LeagueGothic', // LeagueGothic font
                    fontSize: 24.0, // Increased font size
                    color: Colors.teal.shade800, // Darker shade of green
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}