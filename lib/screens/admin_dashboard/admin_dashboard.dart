import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/admin_dashboard/add_admin.dart';

import 'admin_user.dart';
import 'admin_orders.dart';
import 'widgets/stat_card.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        actions: [
              IconButton(
      icon: const Icon(Icons.admin_panel_settings),
      tooltip: 'Manage Admins',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddAdminPage()),
        );
      },
    ),

          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =======================
            // Top Stats Cards
            // =======================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                StatCard(title: "Total Users", collection: "users"),
                StatCard(title: "Total Orders", collection: "orders"),
              ],
            ),

            const SizedBox(height: 20),

            // =======================
            // Users Section
            // =======================
            const Text(
              "Registered Users",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const AdminUsers(),

            const SizedBox(height: 20),

            // =======================
            // Orders Section
            // =======================
            const Text(
              "Orders",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const AdminOrders(),
          ],
        ),
      ),
    );
  }
}
