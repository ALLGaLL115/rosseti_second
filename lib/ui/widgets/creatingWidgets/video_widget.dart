import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

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
      child: SizedBox(
          height: height,
          width: width,
          // padding: const EdgeInsets.all(8),
          child: thumbnailPath == null
              ? Image.asset("assets/images/play_arrow.png")
              : Image.file(File(thumbnailPath!))));
}
