
import 'package:flutter/material.dart';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class SamplePlayer21 extends StatefulWidget {
  SamplePlayer21({Key});

  @override
  _SamplePlayer21State createState() => _SamplePlayer21State();
}

class _SamplePlayer21State extends State<SamplePlayer21> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.networkUrl(Uri.parse("https://cdn.pixabay.com/video/2024/09/24/233024_tiny.mp4"),
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlickVideoPlayer(
        flickManager: flickManager
      ),
    );
  }
}

class SamplePlayer2 extends StatefulWidget {
  SamplePlayer2({Key});

  @override
  _SamplePlayer2State createState() => _SamplePlayer2State();
}

class _SamplePlayer2State extends State<SamplePlayer2> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.asset("assets/mark.mp4"),
      );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlickVideoPlayer(
        flickManager: flickManager
      ),
    );
  }
}

class YoutubeVideo extends StatefulWidget {
  const YoutubeVideo({super.key});

  @override
  State<YoutubeVideo> createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  final videoURL = "https://youtu.be/SkoUu1vhgbg";

  late YoutubePlayerController playerController;
  late String? videoId;

  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(videoURL);
    playerController = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        
      ),
    );
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: playerController,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
    );
  }
}