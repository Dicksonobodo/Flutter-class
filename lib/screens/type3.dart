// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

// class Type3 extends StatefulWidget {
//   const Type3({super.key});

//   @override
//   State<Type3> createState() => _Type3State();
// }

// class _Type3State extends State<Type3> {
//   @override
//   Widget build(BuildContext context) {
//     return const Service();
//   }
// }

// // Post model class
// class Post {
//   final int id;
//   final String name;
//   final String email;
//   final String username;

//   Post({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.username,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       username: json['username'],
//     );
//   }
// }

// // Service widget
// class Service extends StatefulWidget {
//   const Service({super.key});

//   @override
//   State<Service> createState() => _ServiceState();
// }

// class _ServiceState extends State<Service> {
//   late Future<List<Post>> futurePosts;

//   @override
//   void initState() {
//     super.initState();
//     futurePosts = fetchPosts();
//   }

//   Future<List<Post>> fetchPosts() async {
//     var uri = Uri.https('jsonplaceholder.typicode.com', 'users');
//     final response = await http.get(uri);

//     if (response.statusCode == 200) {
//       List<dynamic> data = convert.jsonDecode(response.body);
//       return data.map((json) => Post.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Post>>(
//       future: futurePosts,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//             padding: const EdgeInsets.all(10),
//             itemCount: snapshot.data!.length,
//             shrinkWrap: true, // important
//             physics: NeverScrollableScrollPhysics(), // disable inner scroll
//             itemBuilder: (context, index) {
//               final user = snapshot.data![index];
//               return Card(
//                 elevation: 3,
//                 margin: const EdgeInsets.symmetric(vertical: 8),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.blue,
//                     child: Text(
//                       user.id.toString(),
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   title: Text(
//                     user.name,
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Username: ${user.username}'),
//                       Text('Email: ${user.email}'),
//                     ],
//                   ),
//                   isThreeLine: true,
//                 ),
//               );
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(Icons.error, color: Colors.red, size: 60),
//                 const SizedBox(height: 20),
//                 Text(
//                   'Error: ${snapshot.error}',
//                   style: const TextStyle(color: Colors.red, fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           );
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }
