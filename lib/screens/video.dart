import 'package:first_app/screens/video_player.dart';
import 'package:first_app/screens/youtube.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Video from assets'),
        SamplePlayer2(),
        Text('Video from Youtube'),
        YoutubeVideo(),
        Text('Video from Youtube'),
        YoutubeVideoPlayerFlutter(),
      ],
    );
  }
}
