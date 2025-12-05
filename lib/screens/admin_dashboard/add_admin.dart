import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddAdminPage extends StatelessWidget {
  const AddAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Admins'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var user = users[index];
              String role = user['role'] ?? 'user';
              bool isAdmin = role == 'admin';

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(user['name'] ?? 'No Name'),
                  subtitle: Text(user['email'] ?? 'No Email'),
                  trailing: isAdmin
                      ? const Text(
                          'Admin',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            // Promote to admin
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(user.id)
                                .update({'role': 'admin'});

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      '${user['name']} is now an admin!')),
                            );
                          },
                          child: const Text('Make Admin'),
                        ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
