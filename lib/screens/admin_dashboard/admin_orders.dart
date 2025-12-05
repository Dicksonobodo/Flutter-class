import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widgets/order_tile.dart'; // import the reusable widget

// =============================
// AdminOrders Widget
// Shows all orders and allows admin to mark as done
// =============================
class AdminOrders extends StatelessWidget {
  const AdminOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400, // Adjust height if needed
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("orders")
            .orderBy("timestamp", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var orders = snapshot.data!.docs;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              var order = orders[index];

              // Use reusable OrderTile widget
              return OrderTile(orderDoc: order);
            },
          );
        },
      ),
    );
  }
}
