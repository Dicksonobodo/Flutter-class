import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// =============================
// StatCard Widget
// Shows total number of users or orders
// =============================
class StatCard extends StatelessWidget {
  final String title;
  final String collection;

  const StatCard({required this.title, required this.collection, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection(collection).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          int count = snapshot.data!.docs.length;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
              const Spacer(),
              Text(
                count.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ],
          );
        },
      ),
    );
  }
}
