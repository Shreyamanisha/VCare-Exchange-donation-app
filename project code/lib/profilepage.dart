import 'package:flutter/material.dart';

class UserData {
  static String firstName = '';
  static String lastName = '';
  static String email = '';
  static String address = '';
  static String purposeOfUse = '';
  static DateTime? dateOfBirth;
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPage('Profile');
  }

  Widget _buildPage(String content) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.person, // Use the person icon
              size: 35.0,
              color: Colors.teal.shade900, // Dark green color
            ),
            SizedBox(width: 8.0),
            Text(
              content,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'LeagueGothic', // LeagueGothic font
                color: Colors.teal.shade900, // Dark green color
              ),
            ),
          ],
        ),
        backgroundColor: Colors.teal.shade600, // Set your standard green color
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.teal.shade600, // Set your standard green color
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoCard('Name', '${UserData.firstName} ${UserData.lastName}'),
              _buildInfoCard('Email', UserData.email),
              _buildInfoCard('Address', UserData.address),
              _buildInfoCard('Purpose of Use', UserData.purposeOfUse),
              _buildInfoCard(
                'Date of Birth',
                '${UserData.dateOfBirth?.toLocal()}'.split(' ')[0],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.teal.shade50, // Light green color
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade900, // Dark green color
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            value,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.teal.shade900,// Dark green color
            ),
          ),
        ],
      ),
    );
  }
}
