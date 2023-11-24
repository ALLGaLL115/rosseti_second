import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LocalPlayer extends StatefulWidget {
  LocalPlayer({
    super.key,
    required this.videoPath,
  });

  final String videoPath;

  late final VideoPlayerController videoPlayerController;

  @override
  State<LocalPlayer> createState() => _LocalPlayerState();
}

class _LocalPlayerState extends State<LocalPlayer> {
  @override
  void initState() {
    // TODO: implement initState
    widget.videoPlayerController =
        VideoPlayerController.file(File(widget.videoPath));
    super.initState();
  }

  @override
  void dispose() {
    // // TODO: implement dispose
    // widget._videoPlayerController.pause();
    // widget._videoPlayerController.seekTo(Duration(seconds: 0));

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
                  await widget.videoPlayerController
                      .seekTo(const Duration(seconds: 0, milliseconds: 100));
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
