import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

class CreatePage2 extends StatefulWidget {
  const CreatePage2({
    super.key,
  });

  @override
  State<CreatePage2> createState() => _CreatePage2State();
}

class _CreatePage2State extends State<CreatePage2> {
  Image? image;
  File? imageFile;

  String? videoPath;

  TextEditingController controller = TextEditingController();
  late VideoPlayerController _videoPlayerController;

  @override
  void dispose() {
    // TODO: implement dispose

    controller.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: const Text("create"),
            actions: getActions(context: context),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "tell_me_how_it_is_now",
                    style: standart,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      minLines: 10,
                      maxLines: 10,
                      controller: controller,
                      style: standart,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  const Text(
                    "add_a_photo_or_video",
                    style: standart,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UsersPicture(
                            heroTag: "image",
                            image: image,
                            assetHintPicture: "assets/images/img.png"),
                        GestureDetector(
                            onTap: () {
                              if (videoPath != null) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LocalPlayer(
                                        videoPlayerController:
                                            _videoPlayerController)));
                                //Wright video page with local orientated videoPlayer
                              }
                            },
                            child: Container(
                                height: 58,
                                width: 91,
                                padding: const EdgeInsets.all(8),
                                child: videoPath == null
                                    ? Image.asset(
                                        "assets/images/play_arrow.png")
                                    : VideoPlayer(_videoPlayerController))),
                        roundedCameraButton(
                          assetImagePath: "assets/images/imagBtn.png",
                          onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 250,
                                child: Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      continueButton(
                                          onPressed: () async {
                                            File _image = await pickImage(
                                                imageSource:
                                                    ImageSource.camera);
                                            setState(() {
                                              image = Image.file(_image);
                                              imageFile = _image;
                                            });
                                            if (!context.mounted) return;
                                            Navigator.pop(context);
                                          },
                                          text: "camera_string"),
                                      const Text(
                                        "or",
                                        style: standart,
                                      ),
                                      continueButton(
                                          onPressed: () async {
                                            File _image = await pickImage(
                                                imageSource:
                                                    ImageSource.gallery);
                                            setState(() {
                                              image = Image.file(_image);
                                              imageFile = _image;
                                            });

                                            if (!context.mounted) return;
                                            Navigator.pop(context);
                                          },
                                          text: "galery_string"),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        roundedCameraButton(
                            onPressed: () => showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 250,
                                      child: Padding(
                                        padding: const EdgeInsets.all(35.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            continueButton(
                                                onPressed: () async {
                                                  File videos = await pickVideo(
                                                      imageSource:
                                                          ImageSource.camera);
                                                  videoPath = videos.path;

                                                  setState(() {
                                                    _videoPlayerController =
                                                        VideoPlayerController
                                                            .file(videos)
                                                          ..initialize();
                                                  });
                                                  if (!context.mounted) return;
                                                  Navigator.pop(context);
                                                },
                                                text: "camera_string"),
                                            const Text(
                                              "or",
                                              style: standart,
                                            ),
                                            continueButton(
                                                onPressed: () async {
                                                  File videos = await pickVideo(
                                                      imageSource:
                                                          ImageSource.gallery);
                                                  videoPath = videos.path;
                                                  setState(() {
                                                    _videoPlayerController =
                                                        VideoPlayerController
                                                            .file(videos)
                                                          ..initialize();
                                                    if (!context.mounted)
                                                      return;
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                text: "galery_string"),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                            assetImagePath:
                                "assets/images/video-player 1 (1).png"),
                      ],
                    ),
                  ),
                  continueButton(onPressed: () async {}, text: "next")
                ],
              ),
            ),
          ),
        )));
  }
}

class LocalPlayer extends StatefulWidget {
  const LocalPlayer({
    super.key,
    required VideoPlayerController videoPlayerController,
  }) : _videoPlayerController = videoPlayerController;

  final VideoPlayerController _videoPlayerController;

  @override
  State<LocalPlayer> createState() => _LocalPlayerState();
}

class _LocalPlayerState extends State<LocalPlayer> {
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
                  widget._videoPlayerController.pause();
                  await widget._videoPlayerController
                      .seekTo(const Duration(seconds: 0, milliseconds: 100));
                  if (!context.mounted) return;
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios))),
        body: Center(
          child: Chewie(
              controller: ChewieController(
                  videoPlayerController: widget._videoPlayerController)),
        ),
      ),
    );
  }
}
