import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'profilepage.dart';
import 'homepage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _selectedPurpose = 'Personal Use';
  DateTime? _selectedDate;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  String? _validateAge(DateTime? dob) {
    if (dob == null) {
      return 'Date of Birth is required';
    }
    int age = DateTime.now().year - dob.year;
    if (age <= 10) {
      return 'Age must be greater than 10';
    }
    return null;
  }

  String? _validateFields() {
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _selectedDate == null ||
        _selectedPurpose.isEmpty) {
      return 'Please enter all fields to sign up';
    }
    return null;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _navigateToCreateAccountPage(BuildContext context) {
    String? ageValidation = _validateAge(_selectedDate);
    String? fieldsValidation = _validateFields();

    if (ageValidation == null && fieldsValidation == null) {
      UserData.firstName = _firstNameController.text;
      UserData.lastName = _lastNameController.text;
      UserData.email = _emailController.text;
      UserData.address = _addressController.text;
      UserData.purposeOfUse = _selectedPurpose;
      UserData.dateOfBirth = _selectedDate;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CreateAccountPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(ageValidation ?? fieldsValidation!),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontFamily: 'LeagueGothic',
            fontSize: 35.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal.shade600,
        automaticallyImplyLeading: true,
        actions: [
          SizedBox(width: 8.0),
        ],
      ),
      body: Container(
        color: Colors.teal.shade50,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70), // Adjusted space

                  TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      labelText: 'Address',
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () => _selectDate(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Date of Birth',
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            _selectedDate != null
                                ? "${_selectedDate!.toLocal()}".split(' ')[0]
                                : 'Select Date of Birth',
                          ),
                          Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Select Purpose of Use:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LeageGothic',
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButton<String>(
                    value: _selectedPurpose,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPurpose = newValue!;
                      });
                    },
                    items: <String>['Personal Use', 'NGO, Orphanage, Old Age Home']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: SizedBox(
          width: 150.0,
          height: 60.0,
          child: ElevatedButton(
            onPressed: () {
              _navigateToCreateAccountPage(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.teal.shade600),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontFamily: 'LeagueGothic',
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CreateAccountPage extends StatelessWidget {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: TextStyle(
            fontFamily: 'LeagueGothic',
            fontSize: 35.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal.shade600,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.teal.shade50, // Light green color
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username (Email Id)',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password (6 Digits)',
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              // onPressed: () {
              //   // Call the signUp function with provided email and password
              //   signUp(_usernameController.text, _passwordController.text)
              //       .then((_) {
              //     // Navigate to the home page if signup succeeds
              //     Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(builder: (context) => MyHomePage()),
              //     );
              //   }).catchError((error) {
              //     // Handle signup errors here
              //     print('Sign up failed: $error');
              //     // Show error message to the user using SnackBar, showDialog, etc.
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text('Sign up failed: $error'),
              //       ),
              //     );
              //   });
              // },
              onPressed: () async {
                // Call the signUp function with provided email and password
                try {
                  await signUp(_usernameController.text, _passwordController.text);
                  // Navigate to the home page if signup succeeds
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                } catch (error) {
                  // Handle signup errors here
                  print('Sign up failed: $error');
                  // Show error message to the user using SnackBar, showDialog, etc.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Invalid format: $error'),
                    ),
                  );
                }
              },
              child: SizedBox(
                width: 150.0,
                height: 60.0,
                child: Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontFamily: 'LeagueGothic',
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal.shade600),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
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


// Function for signing up a new user
// Future<void> signUp(String email, String password) async {
//   try {
//     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     // If sign up is successful, userCredential will contain user information
//     print('Signed up successfully: ${userCredential.user!.email}');
//     // You can do further operations here, such as navigating to a new screen
//   } catch (e) {
//     // Handle sign up errors
//     print('Sign up failed: $e');
//     // Show error message to the user
//     String errorMessage = 'Sign up failed';
//     if (e is FirebaseAuthException) {
//       if (e.code == 'weak-password') {
//         errorMessage = 'The password provided is too weak.';
//       } else if (e.code == 'email-already-in-use') {
//         errorMessage = 'The account already exists for that email.';
//       }
//       // Handle other possible error codes...
//     }
//     // Display error message to the user using showDialog, SnackBar, etc.
//   }
// }

Future<void> signUp(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // If sign up is successful, userCredential will contain user information
    print('Signed up successfully: ${userCredential.user!.email}');
    // You can do further operations here, such as navigating to a new screen
  } catch (e) {
    // Handle sign up errors
    print('Sign up failed: $e');
    // Throw an exception to indicate sign up failure
    throw 'Sign up failed';
  }
}

