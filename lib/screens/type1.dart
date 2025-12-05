import 'package:flutter/material.dart';

class Type1 extends StatefulWidget {
  const Type1({super.key});

  @override
  State<Type1> createState() => _Type1State();
}

class _Type1State extends State<Type1> {
  @override
  Widget build(BuildContext context) {
    List Blogs = ["post 1", "post 2", "post 3"];

    return Column(
      children: Blogs.map((blog) => Text(blog)).toList(),
    );
  }
}
