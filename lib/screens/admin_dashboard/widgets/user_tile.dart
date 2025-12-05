import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// =============================
// UserTile Widget
// Reusable tile for displaying a single user in admin dashboard
// =============================
class UserTile extends StatelessWidget {
  final DocumentSnapshot userDoc;

  const UserTile({required this.userDoc, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(userDoc['email'] ?? 'No Email'),
      subtitle: Text("Role: ${userDoc['role']}"),
    );
  }
}
