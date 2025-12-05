import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widgets/user_tile.dart'; // import the reusable widget

// =============================
// AdminUsers Widget
// Shows list of all registered users
// =============================
class AdminUsers extends StatelessWidget {
  const AdminUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Adjust height as needed
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var user = users[index];

              // Use reusable UserTile widget
              return UserTile(userDoc: user);
            },
          );
        },
      ),
    );
  }
}
