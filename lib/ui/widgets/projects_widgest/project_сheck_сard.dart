import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../widgets.dart';

import '../../pages/video_player_page.dart';

Widget checkProjectCard(
    {required String title,
    required String description,
    required String? networkImagePath,
    required String networkVideoPath,
    required VideoPlayerController? videoPlayerController,
    required BuildContext context}) {
  return Column(children: [
    projectsOutputs(
      title: title,
      description: description,
    ),
    const SizedBox(
      height: 8,
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 68,
            width: 121,
            child: networkImagePath == null
                ? null
                : GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Hero(
                            tag: networkImagePath,
                            child: Image.network(networkImagePath)),
                      ));
                    },
                    child: Hero(
                        tag: networkImagePath,
                        child: Image.network(networkImagePath))),
          ),
          SizedBox(
              height: 68,
              width: 121,
              child: networkVideoPath == ""
                  ? null
                  : GestureDetector(
                      onTap: () {
                        if (videoPlayerController != null) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VideoPage(
                              videoPath: networkVideoPath,
                            ),
                          ));
                        }
                      },
                      child: videoPlayerController != null
                          ? VideoPlayer(videoPlayerController)
                          : const Center(child: CircularProgressIndicator()),
                    )),
        ],
      ),
    )
  ]);
}
