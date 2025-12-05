import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Location Page', style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              children: [
                TextSpan(text: 'Listen to the best of '),
                TextSpan(
                  text: 'kendrick lamar',
                  style: TextStyle(color: Colors.orange),
                ),
                TextSpan(text: ' here! \n The greatest rapper of all time! \n Best music madefor you!'),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Text(
            'Crafted with love \n Inspiration to perfection to ease your mind',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/music');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
            ),
            child: Text(
              'LISTEN NOW',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      )),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.black,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                }),
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {}),
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0),
              child: IconButton(
                  icon: Icon(
                    Icons.headset,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            ),
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                }),
          ],
        ),
      ),
    )
    );
  }
}
