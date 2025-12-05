class UserModel {
  final String uid;
  final String name;
  final String email;
  final String role;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.role,
  });

  // Convert Firestore data → Model
  factory UserModel.fromMap(String id, Map<String, dynamic> data) {
    return UserModel(
      uid: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      role: data['role'] ?? 'user',
    );
  }

  // Convert Model → Firestore data
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "role": role,
    };
  }
}
