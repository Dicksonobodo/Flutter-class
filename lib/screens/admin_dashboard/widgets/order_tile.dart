import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// =============================
// OrderTile Widget
// Reusable tile for displaying a single order in admin dashboard
// =============================
class OrderTile extends StatelessWidget {
  final DocumentSnapshot orderDoc;

  const OrderTile({required this.orderDoc, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(orderDoc['product'] ?? 'No Product'),
        subtitle: Text(
            "Qty: ${orderDoc['quantity']} | Status: ${orderDoc['status']}"),
        trailing: Checkbox(
          value: orderDoc['status'] == 'done',
          onChanged: (value) {
            FirebaseFirestore.instance
                .collection('orders')
                .doc(orderDoc.id)
                .update({'status': value! ? 'done' : 'pending'});
          },
        ),
      ),
    );
  }
}
