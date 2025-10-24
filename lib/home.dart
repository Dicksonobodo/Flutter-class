import 'package:flutter/material.dart';
import 'package:first_app/card.dart';
import 'package:first_app/increment.dart';
import 'package:first_app/video_player.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Dixon app',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text('Video from url'),
                SamplePlayer21(),

                

                Increment(),
                // Blogs(),
                CustomCard()

                
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 8.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(icon: Icon(Icons.home), onPressed: () {
                  Navigator.pushNamed(context, '/');

                }),
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0), // Add padding to the top
                  child:
                      IconButton(icon: Icon(Icons.headset), onPressed: () {}),
                ),
                IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
                IconButton(icon: Icon(Icons.settings), onPressed: () {
                  Navigator.pushNamed(context, '/location');
                }),
              ],
            ),
          ),
        ),
      );
  }
}