import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.amber,
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Dixon don't give up",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text("Author - dixon"),
            ],
          ),
        ));
  }
}
