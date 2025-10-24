import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 2,
            child: Container(
              height: 200,
              margin: EdgeInsets.all(10),
              color: Colors.amber,
              child: Center(child: Text('1')),
            )),
        Expanded(
            flex: 1,
            child: Container(
              height: 200,
              margin: EdgeInsets.all(10),
              color: Colors.blue,
              child: Center(child: Text('2')),
            )),
      ],
    );
  }
}
