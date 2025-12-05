// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Type4 extends StatelessWidget {
//   const Type4({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Service();
//   }
// }

// class User {
//   final String id;
//   final Timestamp? createdAt;
//   final String password;
//   final String username;

//   User({
//     required this.id,
//     this.createdAt,
//     required this.password,
//     required this.username,
//   });

//   factory User.fromFirestore(DocumentSnapshot doc) {
//     Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
//     return User(
//       id: doc.id,
//       createdAt: json['createdAt'],
//       password: json['password'],
//       username: json['username'],
//     );
//   }
// }

// class Service extends StatefulWidget {
//   const Service({super.key});

//   @override
//   State<Service> createState() => _ServiceState();
// }

// class _ServiceState extends State<Service> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;


// Future<void> _deleteData(String docId) async {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Delete Data'),
//         content: const Text('Are you sure you want to delete this data?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel', style: TextStyle(color: Colors.orange)),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red,
//             ),
//             onPressed: () async {
//               try {
//                 await _firestore.collection('users').doc(docId).delete();
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('Data deleted successfully!'),
//                     backgroundColor: Colors.green,
//                   ),
//                 );
//               } catch (e) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('Error: $e'),
//                     backgroundColor: Colors.red,
//                   ),
//                 );
//               }
//             },
//             child: const Text('Delete', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _editData(User user) async {
//     final usernameController = TextEditingController(text: user.username);
//     final passwordController = TextEditingController(text: user.password);
//     final formKey = GlobalKey<FormState>();
//     bool isLoading = false;

//     await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Edit Data'),
//         content: Form(
//           key: formKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextFormField(
//                 controller: usernameController,
//                 decoration: const InputDecoration(labelText: 'Username'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a username';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: passwordController,
//                 decoration: const InputDecoration(labelText: 'Password'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a password';
//                   }
//                   return null;
//                 },
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel', style: TextStyle(color: Colors.orange)),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               if (formKey.currentState!.validate()) {
//                 setState(() {
//                   isLoading = true;
//                 });

//                 try {
//                   await _firestore.collection('users').doc(user.id).update({
//                     'username': usernameController.text,
//                     'password': passwordController.text,
//                   });

//                   Navigator.pop(context);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Data updated successfully!'),
//                       backgroundColor: Colors.green,
//                     ),
//                   );
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Error: $e'),
//                       backgroundColor: Colors.red,
//                     ),
//                   );
//                 } finally {
//                   if (mounted) {
//                     setState(() {
//                       isLoading = false;
//                     });
//                   }
//                 }
//               }
//             },
//             child: isLoading
//                 ? const CircularProgressIndicator(color: Colors.white)
//                 : const Text('Save', style: TextStyle(color: Colors.orange)),
//           ), 
//         ],
//       ),    
//     );
//   }



//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _firestore.collection('users').orderBy('createdAt', descending: true).snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         final users = snapshot.data!.docs.map((doc) => User.fromFirestore(doc)).toList();

//         return ListView.builder(
//           itemCount: users.length,
//           itemBuilder: (context, index) {
//             final user = users[index];
//             return ListTile(
//               title: Text(user.username),
//               subtitle: Text('Password: ${user.password}\nCreated At: ${user.createdAt?.toDate() ?? 'N/A'}'),
//               isThreeLine: true,
//               trailing: Container(
//                 color: Colors.grey[200],
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.edit),
//                       onPressed: () {
//                         // Handle edit user
//                         _editData(user);
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.delete),
//                       onPressed: () {
//                         // Handle delete user
//                         _deleteData(user.id);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }