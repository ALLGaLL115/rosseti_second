import 'package:flutter/material.dart';
import 'package:rosseti_second/strings.dart';

import 'package:video_player/video_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';
import 'package:rosseti_second/ui/pages/player_page.dart';
import 'package:rosseti_second/second_try/models/suggestion_model.dart';
import 'package:rosseti_second/second_try/blocs/cubits/rating_cubit/rating_cubit.dart';
import 'package:rosseti_second/second_try/blocs/cubits/desizion_cubit/desizion_cubit.dart';
import 'package:rosseti_second/second_try/blocs/cubits/expertize_cubit/expertise_cubit.dart';

class ProjectDescriptionPage extends StatefulWidget {
  final Suggestion suggestion;
  const ProjectDescriptionPage({super.key, required this.suggestion});

  @override
  State<ProjectDescriptionPage> createState() => _ProjectDescriptionPageState();
}

class _ProjectDescriptionPageState extends State<ProjectDescriptionPage> {
  late Suggestion suggestion;
  VideoPlayerController? _existingVideoController;
  VideoPlayerController? _proposedVideoController;

  @override
  void initState() {
    suggestion = widget.suggestion;
    if (suggestion.existingSolutionVideo != null) {
      _existingVideoController = VideoPlayerController.networkUrl(
          Uri.parse(suggestion.existingSolutionVideo!))
        ..initialize().then((_) {
          setState(() {});
        });
    }
    if (suggestion.proposedSolutionVideo != null) {
      _proposedVideoController = VideoPlayerController.networkUrl(
          Uri.parse(suggestion.proposedSolutionVideo!))
        ..initialize().then((_) {
          setState(() {});
        });
    }

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (_existingVideoController != null) {
      _existingVideoController!.dispose();
    }
    if (_proposedVideoController != null) {
      _proposedVideoController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final expertizeCubit = context.watch<ExpertiseCubit>();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(stringsUi['create']!),
              actions: getActions(context: context),
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    inputFieldLarge(
                        titleText: stringsUi['nowSo']!,
                        initialInputText: suggestion.existingSolutionText,
                        readOnly: true),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          imageApi(imagePath: suggestion.existingSolutionImage),
                          videoApi(
                              context: context,
                              controller: _existingVideoController),
                        ],
                      ),
                    ),
                    inputFieldLarge(
                        titleText: stringsUi['shouldBe']!,
                        initialInputText: suggestion.proposedSolutionText,
                        readOnly: true),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          imageApi(imagePath: suggestion.proposedSolutionImage),
                          videoApi(
                              context: context,
                              controller: _proposedVideoController)
                        ],
                      ),
                    ),
                    inputFieldLarge(
                        titleText: stringsUi['willBe']!,
                        initialInputText:
                            widget.suggestion.existingSolutionText,
                        readOnly: true),
                    ratingWidget(
                      onChange: (value) {
                        context
                            .read<RatingCubit>()
                            .updateRaitng(rating: value.toInt());

                        // потом где-то вызвать checkBloc.add((PostRatingEvent()));
                      },
                    ),
                    continueButton(
                        onPressed: () {
                          context.read<RatingCubit>().postRating(
                              suggestionId: suggestion.id!, context: context);
                        },
                        text: stringsUi['discuss']!),
                    expertizeCubit.state.isExpertize

                        // checkBloc.state.inspector == SuggestionCheckInspector.expert
                        ? desizionButton(onAgree: () {
                            context.read<DesizionCubit>().postDesizion(
                                context: context,
                                accepted: 1,
                                suggestionId: suggestion.id!,
                                expertId: Boxes.getUserBox().values.first.id!);
                          }, onDisagree: () {
                            context.read<DesizionCubit>().postDesizion(
                                context: context,
                                accepted: 0,
                                suggestionId: suggestion.id!,
                                expertId: Boxes.getUserBox().values.first.id!);
                          })
                        : const SizedBox(),
                  ],
                )))));
  }

  Center dialogWidget(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150,
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(stringsUi['sendRating?']!),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {}, child: Text(stringsUi["yes"]!)),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(stringsUi["no"]!)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  videoApi({required BuildContext context, VideoPlayerController? controller}) {
    return Container(
      height: 68,
      width: 128,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: controller != null
          ? _proposedVideoController!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _proposedVideoController!.value.aspectRatio,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PlayerPage(
                                  videoPlayerController: controller,
                                )));
                      },
                      child: VideoPlayer(controller)),
                )
              : const Center(child: CircularProgressIndicator())
          : Image.asset("assets/images/play_arrow.png"),
    );
  }

  imageApi({String? imagePath}) {
    return Container(
      height: 68,
      width: 128,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: imagePath != null
          ? Image.network(
              imagePath,
            )
          : emptyImage(),
    );
  }

  Image emptyImage() => Image.asset("assets/images/img.png");
}
