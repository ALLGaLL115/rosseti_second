import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

videoWidget({
  required BuildContext context,
  String? videoPath,
  String? thumbnailPath,
  required double height,
  required double width,
}) {
  return GestureDetector(
      onTap: () {
        if (videoPath != null) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  VideoPlayer(VideoPlayerController.file(File(videoPath)))));
        }
      },
      child: Column(
        children: [
          SizedBox(
              height: height,
              width: width,
              // padding: const EdgeInsets.all(8),
              child: thumbnailPath == ""
                  ? Image.asset("assets/images/play_arrow.png")
                  : Image.file(File(thumbnailPath!))),
        ],
      ));
}
