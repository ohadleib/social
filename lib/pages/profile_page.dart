import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/pages/components/my_back_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          // loading..
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } 
          // error
          else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } 
         // data received
else if (snapshot.hasData) {
  // extract data
  Map<String, dynamic>? user = snapshot.data!.data();

 return Center(
  child: Column(
    children: [
      // back button
      const Padding(
        padding: EdgeInsets.only(
          top: 50.0,
          left: 25,
        ), // EdgeInsets.only
        child: Row(
          children: [
            MyBackButton(),
          ],
        ), // Row
      ), // Padding
      const SizedBox(height: 25),
      // profile pic

        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.all(25),
          child: const Icon(
            Icons.person,
            size: 64,
          ),
        ),
        const SizedBox(height: 25),

       // username
Text(
  user!['username'],
  style: const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ), // TextStyle
), // Text

const SizedBox(height: 10),

// email
Text(
  user['email'],
  style: TextStyle(
    color: Colors.grey[600],
  ), // TextStyle
), // Text
]
    ),
  );
}

          else {
            return Text("No data");
          }
        },
      ),
    );
  }
}
