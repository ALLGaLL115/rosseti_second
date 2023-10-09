import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rosseti_second/data/models/models.dart';
import 'package:rosseti_second/ui/pages/pages.dart';
import 'package:rosseti_second/ui/widgets/projectCheckCard.dart';
import 'package:video_player/video_player.dart';

import '../../constants/constants.dart';

class SuggestionDescriptionPage extends StatefulWidget {
  final Suggestion suggestion;
  const SuggestionDescriptionPage({
    super.key,
    required this.suggestion,
  });

  @override
  State<SuggestionDescriptionPage> createState() =>
      _SuggestionDescriptionPageState();
}

class _SuggestionDescriptionPageState extends State<SuggestionDescriptionPage> {
  late VideoPlayerController _exetingVideoController;
  late VideoPlayerController _proposedideoController;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.suggestion.existingSolutionVideo != null) {
      _exetingVideoController = VideoPlayerController.networkUrl(
          Uri.parse(widget.suggestion.existingSolutionVideo!))
        ..initialize().then((_) {
          setState(() {});
        });
    }

    if (widget.suggestion.proposedSolutionVideo != null) {
      _proposedideoController = VideoPlayerController.networkUrl(
          Uri.parse(widget.suggestion.proposedSolutionVideo!))
        ..initialize().then((_) {
          setState(() {});
        });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Создать"),
        actions: getActions(context: context),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: SingleChildScrollView(
            child: Column(
              children: [
                checkProjectCard(
                    size: size,
                    title: 'Сейчас так:',
                    description: widget.suggestion.proposedSolutionText ?? "",
                    networkImagePath: widget.suggestion.proposedSolutionImage ??
                        "https://avatars.mds.yandex.net/i?id=3764ee6f3757f01ae5186486aa3f2bccd3c1d483-5220281-images-thumbs&n=13",
                    networkVideoPath:
                        widget.suggestion.existingSolutionVideo ?? "",
                    videoPlayerController: _exetingVideoController,
                    context: context),
                const SizedBox(
                  height: 25,
                ),
                checkProjectCard(
                    size: size,
                    title: 'Сейчас так:',
                    description: widget.suggestion.proposedSolutionText ?? "",
                    networkImagePath: widget.suggestion.proposedSolutionImage ??
                        "https://avatars.mds.yandex.net/i?id=3764ee6f3757f01ae5186486aa3f2bccd3c1d483-5220281-images-thumbs&n=13",
                    networkVideoPath:
                        widget.suggestion.existingSolutionVideo ?? "",
                    videoPlayerController: _proposedideoController,
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
                RatingBar.builder(
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
                    onRatingUpdate: (ratingValue) {}),
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
                )
              ],
            ),
          )),
    ));
  }
}
