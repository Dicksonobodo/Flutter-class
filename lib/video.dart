import 'package:first_app/video_player.dart';
import 'package:first_app/youtube.dart';
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
