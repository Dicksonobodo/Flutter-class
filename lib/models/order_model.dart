// ==========================================
// Order Model
// Represents an order placed by a user
// ==========================================

class OrderModel {
  final String id;
  final String userId;
  final String product;
  final int quantity;
  final String status; // 'pending' or 'done'

  OrderModel({
    required this.id,
    required this.userId,
    required this.product,
    required this.quantity,
    required this.status,
  });

  // Convert Firestore document → OrderModel
  factory OrderModel.fromMap(String id, Map<String, dynamic> data) {
    return OrderModel(
      id: id,
      userId: data['userId'] ?? '',
      product: data['product'] ?? '',
      quantity: data['quantity'] ?? 1,
      status: data['status'] ?? 'pending',
    );
  }

  // Convert OrderModel → Firestore document
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'product': product,
      'quantity': quantity,
      'status': status,
    };
  }
}
