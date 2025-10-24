import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  late YoutubePlayerController _ytController;

  @override
  void initState() {
    super.initState();
    _ytController = YoutubePlayerController(
      initialVideoId: 'H58vbez_m4E',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _ytController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Music player',
              style: TextStyle(color: Colors.white, fontFamily: "IndieFlower"),
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(
                height: 20.0,
                color: Colors.grey,
              ),

              // YouTube player
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: YoutubePlayer(
                  controller: _ytController,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.red,
                ),
              ),

              const SizedBox(height: 12),

              const Text('Now playing: Kendrick Lamar',
                  style: TextStyle(fontSize: 16)),

              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _ytController.play();
                },
                child: const Text('Play'),
              ),
            ],
          ),
        ),
        
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          color: Colors.black,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  }),
              IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: IconButton(
                    icon: const Icon(
                      Icons.headset,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ),
              IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
  

  