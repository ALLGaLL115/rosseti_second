import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rosseti_second/data/models/models.dart';
import 'package:rosseti_second/ui/pages/pages.dart';
import 'package:video_player/video_player.dart';

import '../../constants/constants.dart';

class CreatePage3 extends StatefulWidget {
  const CreatePage3({
    super.key,
  });

  @override
  State<CreatePage3> createState() => _CreatePage3State();
}

class _CreatePage3State extends State<CreatePage3> {
  Image? image;
  File? imageFile;

  String? videoPath;

  TextEditingController controller = TextEditingController();
  late VideoPlayerController _videoPlayerController;
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: const Text("Создать"),
            actions: getActions(context: context),
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 141, left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Расскажите как надо",
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
                      style: chatTextStyle,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  const Text(
                    "Добавьте фото или видео",
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
                                          text: "Camera"),
                                      const Text(
                                        "or",
                                        style: standartGrey,
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
                                          text: "Galery"),
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
                                                  _videoPlayerController =
                                                      VideoPlayerController
                                                          .file(videos)
                                                        ..initialize()
                                                            .then((_) {
                                                          setState(() {});
                                                        });
                                                  if (!context.mounted) return;
                                                  Navigator.pop(context);
                                                },
                                                text: "Camera"),
                                            const Text(
                                              "or",
                                              style: standartGrey,
                                            ),
                                            continueButton(
                                                onPressed: () async {
                                                  File videos = await pickVideo(
                                                      imageSource:
                                                          ImageSource.gallery);
                                                  videoPath = videos.path;
                                                  _videoPlayerController =
                                                      VideoPlayerController
                                                          .file(videos)
                                                        ..initialize()
                                                            .then((_) {
                                                          setState(() {});
                                                        });
                                                  if (!context.mounted) return;
                                                  Navigator.pop(context);
                                                },
                                                text: "Galery"),
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
                  continueButton(
                      onPressed: () {
                        if (imageFile != null && videoPath != null) {
                          SendSuggestion.addFrom3(
                              existingSolutionText: controller.text,
                              existingSolutionImage: imageFile!.path,
                              existingSolutionVideo: videoPath!);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CreatePage4()));
                        } else {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: const Text("Empty photo or video"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("ok"))
                                    ],
                                  ));
                        }
                      },
                      text: "Continue")
                ],
              ),
            ),
          ),
        )));
  }
}
