import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:video_player/video_player.dart';

import '../../constants/constants.dart';
import '../widgets/widgets.dart';
import '../../data/models/models.dart';
import '../widgets/projectCheckCard.dart';
import 'conversation_page.dart';

class DoExpertDissizionPage extends StatefulWidget {
  final Suggestion suggestion;
  const DoExpertDissizionPage({
    super.key,
    required this.suggestion,
  });

  @override
  State<DoExpertDissizionPage> createState() => _DoExpertDissizionPageState();
}

class _DoExpertDissizionPageState extends State<DoExpertDissizionPage> {
  VideoPlayerController? _proposedVideoController;
  VideoPlayerController? _existingVideoController;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.suggestion.existingSolutionVideo != null) {
      _existingVideoController = VideoPlayerController.networkUrl(
          Uri.parse(widget.suggestion.existingSolutionVideo!))
        ..initialize().then((_) {
          setState(() {});
        });
    } else {
      haveVideo = false;
      setState(() {});
    }
    if (widget.suggestion.proposedSolutionVideo != null) {
      _proposedVideoController = VideoPlayerController.networkUrl(
          Uri.parse(widget.suggestion.proposedSolutionVideo!))
        ..initialize().then((_) {
          _existingVideoController!.seekTo(Duration.zero);

          setState(() {});
        });
    } else {
      haveVideo = false;
      setState(() {});
    }
    super.initState();
  }

  bool haveVideo = true;

  @override
  void dispose() {
    // TODO: implement dispose
    if (_existingVideoController != null && _proposedVideoController != null) {
      _existingVideoController!.dispose();
      _proposedVideoController!.dispose();
    }
    super.dispose();
  }

  double dub = 0;
  @override
  Widget build(BuildContext context) {
    Size size = Globals().size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Создать"),
        actions: getActions(context: context),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: ListView(
            shrinkWrap: true,
            children: [
              checkProjectCard(
                  size: size,
                  title: 'Сейчас так:',
                  description: widget.suggestion.existingSolutionText ?? "",
                  networkImagePath: widget.suggestion.existingSolutionImage,
                  networkVideoPath:
                      widget.suggestion.existingSolutionVideo ?? "",
                  videoPlayerController: _existingVideoController,
                  context: context),
              const SizedBox(
                height: 25,
              ),
              checkProjectCard(
                  size: size,
                  title: 'Будет так:',
                  description: widget.suggestion.proposedSolutionText ?? "",
                  networkImagePath: widget.suggestion.proposedSolutionImage,
                  networkVideoPath:
                      widget.suggestion.proposedSolutionVideo ?? "",
                  videoPlayerController: _proposedVideoController,
                  context: context),
              const SizedBox(
                height: 25,
              ),
              projectsOutputs(
                  title: "И тогда будет так :",
                  size: size,
                  description: widget.suggestion.positiveEffect ?? ""),
              const SizedBox(
                height: 25,
              ),
              const Row(
                children: [
                  Text(
                    "Оцените проект:",
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              builderRaiting((double asdf) {
                dub = asdf;
                setState(() {});
              }),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: continueButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Conversation(),
                      ));
                    },
                    text: "Обсудить"),
              ),
              const SizedBox(
                height: 20,
              ),
              //Dessizion buttons
              Row(
                children: [
                  Flexible(
                      child: SizedBox(
                    height: 58,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            foregroundColor: Colors.white),
                        onPressed: () {},
                        child: const Icon(Icons.add)),
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 58,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: mainColor),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const RotationTransition(
                              turns: AlwaysStoppedAnimation(45 / 360),
                              child: Icon(
                                Icons.add,
                              ))),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          )),
    ));
  }

  RatingBar builderRaiting(void getRaiting(double value)) {
    return RatingBar.builder(
        initialRating: 4,
        glowColor: Colors.amber,
        unratedColor: Colors.grey.withOpacity(0.3),
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 5,
        itemPadding: const EdgeInsets.all(8),
        itemSize: 40,
        itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
        onRatingUpdate: (ratingValue) {
          getRaiting(ratingValue);
        });
  }
}
