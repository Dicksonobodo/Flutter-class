// // import 'package:first_app/components/card.dart';
// // import 'package:first_app/components/increment.dart';
// // import 'package:first_app/screens/video_player.dart';
// import 'package:first_app/screens/type4.dart';
// import 'package:flutter/material.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> _addData() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       try {
//         await _firestore.collection('users').add({
//           'username': _usernameController.text,
//           'password': _passwordController.text,
//           'createdAt': FieldValue.serverTimestamp(),
//         });

//         _usernameController.clear();
//         _passwordController.clear();

//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Data added successfully!'),
//             backgroundColor: Colors.green,
//           ),
//         );
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error: $e'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       } finally {
//         if (mounted) {
//           setState(() {
//             _isLoading = false;
//           });
//         }
//       }
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 // Text('Video from url'),
//                 // SamplePlayer21(),
//                 // Increment(),
//                 // Blogs(),
//                 // CustomCard()   
//                 // Form widget
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: _usernameController,
//                         decoration: const InputDecoration(
//                           labelText: 'Username',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter username';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         controller: _passwordController,
//                         decoration: const InputDecoration(
//                           labelText: 'Password',
//                           border: OutlineInputBorder(),
//                         ),
//                         obscureText: true,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter password';
//                           }
//                           return null;
//                         },
//                       ),

//                       const SizedBox(height: 16),
                      
//                       ElevatedButton(
//                         onPressed: _isLoading ? null : _addData,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 50,
//                             vertical: 15,
//                           ),
//                         ),
//                         child: _isLoading
//                             ? const SizedBox(
//                                 height: 20,
//                                 width: 20,
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2,
//                                   valueColor: AlwaysStoppedAnimation<Color>(
//                                     Colors.white,
//                                   ),
//                                 ),
//                               )
//                             : const Text(
//                                 'Add Data',
//                                 style: TextStyle(
//                                     fontSize: 16, color: Colors.white),
//                               ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 16),

//               SizedBox(height: 400, child: Type4()),

//               ],
//             ),
//           ),
//           bottomNavigationBar: BottomAppBar(
//             shape: CircularNotchedRectangle(),
//             notchMargin: 8.0,
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 IconButton(icon: Icon(Icons.home), onPressed: () {
//                   Navigator.pushNamed(context, '/');

//                 }),
//                 IconButton(icon: Icon(Icons.search), onPressed: () {}),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 16.0), // Add padding to the top
//                   child:
//                       IconButton(icon: Icon(Icons.headset), onPressed: () {}),
//                 ),
//                 IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
//                 IconButton(icon: Icon(Icons.person), onPressed: () {
//                   Navigator.pushNamed(context, '/profile');
//                 }),
//               ],
//             ),
//           ),
//         ),
//       );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// =============================
// UserHome Screen
// Allows normal users to place orders and view their own orders
// =============================
class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final productController = TextEditingController();
  final quantityController = TextEditingController();

  @override
  void dispose() {
    productController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Home")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Place Order",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Product input
            TextField(
              controller: productController,
              decoration: const InputDecoration(labelText: "Product"),
            ),
            const SizedBox(height: 10),

            // Quantity input
            TextField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: "Quantity"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // Submit Order button
            ElevatedButton(
              onPressed: () async {
                String uid = FirebaseAuth.instance.currentUser!.uid;

                await FirebaseFirestore.instance.collection("orders").add({
                  'userId': uid,
                  'product': productController.text,
                  'quantity':
                      int.tryParse(quantityController.text) ?? 1,
                  'status': 'pending',
                  'timestamp': FieldValue.serverTimestamp(),
                });

                productController.clear();
                quantityController.clear();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Order placed!")),
                );
              },
              child: const Text("Submit Order"),
            ),

            const SizedBox(height: 40),
            const Text(
              "My Orders",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            // List of user's own orders
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("orders")
                    .where("userId",
                        isEqualTo:
                            FirebaseAuth.instance.currentUser!.uid)
                    .orderBy("timestamp", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                        child: SizedBox());
                  }

                  var docs = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      var order = docs[index];
                      return ListTile(
                        title: Text(order['product']),
                        subtitle: Text(
                            "Qty: ${order['quantity']} | Status: ${order['status']}"),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                }),
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0), // Add padding to the top
              child:
                  IconButton(icon: const Icon(Icons.headset), onPressed: () {}),
            ),
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                }),
          ],
        ),
      ),
    );
  }
}
