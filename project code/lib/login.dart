import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance; // Initialize FirebaseAuth

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            fontFamily: 'LeagueGothic',
            fontSize: 35.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal.shade600,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                labelText: 'Username (Email Id)',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              style: TextStyle(fontSize: 20.0),
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password (6 Digit)',
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                // Retrieve username and password from text fields
                String username = _usernameController.text;
                String password = _passwordController.text;
                // Call signin function with provided username and password
                User? user = await signin(username, password);
                if (user != null) {
                  // Navigate to the home page if login succeeds
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                } else {
                  // Handle login errors here
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Login failed. Please check your credentials.'),
                  ));
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.teal.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'LeagueGothic',
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function for logging in an existing user
  Future<User?> signin(String email, String password) async {
    try {
      UserCredential credential =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = credential.user;
      print('Logged In successfully: ${user!.email}');
      //print(user?.email);
      return user;
    } catch (ex) {
      print('Something went wrong: ${ex.toString()}');
      return null;
    }
  }
}
