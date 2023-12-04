import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerPage extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  const PlayerPage({
    super.key,
    required this.videoPlayerController,
  });

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () async {
                  widget.videoPlayerController.pause();
                  if (!context.mounted) return;
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios))),
        body: Center(
          child: Chewie(
              controller: ChewieController(
                  videoPlayerController: widget.videoPlayerController)),
        ),
      ),
    );
  }
}
