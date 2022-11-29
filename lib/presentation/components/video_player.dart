import 'package:flutter/material.dart';

// TODO
class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton.small(
          onPressed: () {},
          child: Icon(
            Icons.skip_previous_outlined,
          ),
        ),
        FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.play_circle,
          ),
        ),
        FloatingActionButton.small(
          onPressed: () {},
          child: Icon(
            Icons.skip_next_outlined,
          ),
        ),
      ],
    );
  }
}
