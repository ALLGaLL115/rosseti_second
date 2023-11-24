import 'dart:io';

import '../widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rosseti_second/strings.dart';

takeVideoButton(
    {required BuildContext context,
    required Function(String videoPath) onPressed}) {
  return roundedCameraButton(
      onPressed: () => showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      continueButton(
                        onPressed: () async {
                          File videos =
                              await pickVideo(imageSource: ImageSource.camera);
                          onPressed(videos.path);
                          if (!context.mounted) return;
                          Navigator.pop(context);
                        },
                        text: "camera_string",
                      ),
                      const Text(
                        "or",
                        style: standart,
                      ),
                      continueButton(
                        onPressed: () async {
                          String videos =
                              await pickVideo(imageSource: ImageSource.gallery);
                          onPressed(videos);

                          if (!context.mounted) return;
                          Navigator.pop(context);
                        },
                        text: "galery_string",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      assetImagePath: "assets/images/video-player 1 (1).png");
}
