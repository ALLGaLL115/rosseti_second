import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti_second/second_try/blocs/suggestion_blocs/creating_suggestion_bloc/creating_suggestion_bloc.dart';
import 'package:rosseti_second/second_try/blocs/suggestion_blocs/post_suggestion_bloc/post_suggestion_bloc.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/models/send_suggestion.dart';

import 'package:rosseti_second/second_try/providers/send_suggestion_provider.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/text_styles.dart';
import 'package:rosseti_second/ui/pages/home_page.dart';
import '../widgets/widgets.dart';

// class CreatingPage extends StatelessWidget {
//   const CreatingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CreatingView();
//   }
// }

class CreatingView extends StatelessWidget {
  final _formSecondKey = GlobalKey<FormState>();
  final _formThirdKey = GlobalKey<FormState>();
  final _formFourthKey = GlobalKey<FormState>();

  CreatingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatingSuggestionBloc(
          sendSuggestionProvider: context.read<SendSuggestionProvider>()),
      child: BlocBuilder<CreatingSuggestionBloc, CreatingSuggestionState>(
        builder: (context, state) {
          final bloc = context.watch<CreatingSuggestionBloc>();

          return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                  appBar: AppBar(
                    title: Text(stringsUi["create"]!),
                    leading: BackButton(
                      onPressed: () {
                        switch (state.creatingSuggestionPage) {
                          case CreatingSuggestionPage.first:
                            Navigator.of(context).pop();
                          case CreatingSuggestionPage.second:
                            bloc.add(const CreatingSuggestionPageChangeEvent(
                                creatingSuggestionPage:
                                    CreatingSuggestionPage.first));
                          case CreatingSuggestionPage.third:
                            bloc.add(const CreatingSuggestionPageChangeEvent(
                                creatingSuggestionPage:
                                    CreatingSuggestionPage.second));

                          case CreatingSuggestionPage.fourth:
                            bloc.add(const CreatingSuggestionPageChangeEvent(
                                creatingSuggestionPage:
                                    CreatingSuggestionPage.third));
                        }
                      },
                    ),
                    actions: getActions(context: context),
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(35),
                      child: Builder(
                        builder: (context) {
                          switch (state.creatingSuggestionPage) {
                            case CreatingSuggestionPage.first:
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    stringsUi['tellAboutOffer']!,
                                    style: basicTextStyle,
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    stringsUi['chooseThemeAndName']!,
                                    style: basicTextStyle,
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: DropdownButtonFormField(
                                            isExpanded: true,
                                            isDense: false,
                                            itemHeight: 50,
                                            value: state.topic == ''
                                                ? null
                                                : Boxes.getTopicsBox()
                                                    .values
                                                    .firstWhere((topic) =>
                                                        topic.title ==
                                                        state.topic),
                                            items: Boxes.getTopicsBox()
                                                .values
                                                .toList()
                                                .map(
                                                    (topic) => DropdownMenuItem(
                                                        value: topic,
                                                        child: Text(
                                                          topic.title,
                                                          textWidthBasis:
                                                              TextWidthBasis
                                                                  .parent,
                                                          style: const TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                          maxLines: 2,
                                                        )))
                                                .toList(),
                                            decoration:
                                                textFieldInputDecoration(
                                                    hintText:
                                                        stringsUi["topic"]),
                                            onChanged: (value) => bloc.add(
                                                TopicChangeEvent(
                                                    topic: value!.title))),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  TextFormField(
                                    decoration: textFieldInputDecoration(
                                        hintText: stringsUi["naming"]),
                                    initialValue: state.title,
                                    onChanged: (value) {
                                      bloc.add(TitleChangeEvent(title: value));
                                    },
                                  ),
                                  const SizedBox(
                                    height: 150,
                                  ),
                                  continueButton(
                                      onPressed: () {
                                        bloc.add(
                                            const CreatingSuggestionPageChangeEvent(
                                                creatingSuggestionPage:
                                                    CreatingSuggestionPage
                                                        .second));
                                      },
                                      text: stringsUi['next']!),
                                ],
                              );
                            case CreatingSuggestionPage.second:
                              return Form(
                                key: _formSecondKey,
                                child: Column(
                                  children: [
                                    Text(stringsUi['howItsNow']!,
                                        style: basicTextStyle),
                                    TextFormField(
                                      minLines: 10,
                                      maxLines: 10,
                                      initialValue: state.existingSolutionText,
                                      decoration: textFieldInputDecoration(),
                                      onChanged: (value) {
                                        bloc.add(
                                            ExistingSolutionTextChangeEvent(
                                                existingSolutionText: value));
                                      },
                                      validator: (value) =>
                                          state.existingSolutionTextIsValid
                                              ? null
                                              : stringsUi["emptyField"]!,
                                    ),
                                    Text(
                                      stringsUi["addPhotoOrVideo"]!,
                                      style: basicTextStyle,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        imageWidget(
                                          context: context,
                                          heroTag: "second",
                                          imagePath:
                                              state.existingSolutionImage,
                                          height: 58,
                                          width: 94,
                                        ),
                                        videoWidget(
                                            context: context,
                                            videoPath:
                                                state.existingSolutionVideo,
                                            thumbnailPath: state
                                                .existingSolutionVideoThumbnail,
                                            height: 58,
                                            width: 94),
                                        takePhotoButton(
                                            context: context,
                                            onPressed: (imagePath) {
                                              bloc.add(
                                                  ExistingSolutionImageChangeEvent(
                                                      existingSolutionImage:
                                                          imagePath));
                                            }),
                                        takeVideoButton(
                                            context: context,
                                            onPressed: (videoPath) async {
                                              bloc.add(
                                                  ExistingSolutionVideoChangeEvent(
                                                      existingSolutionVideo:
                                                          videoPath));
                                            }),
                                      ],
                                    ),
                                    continueButton(
                                        onPressed: () {
                                          if (_formSecondKey.currentState!
                                              .validate()) {
                                            if (state
                                                    .existingSolutionImageIsValid
                                                // && state.existingSolutionVideoIsValid
                                                ) {
                                              bloc.add(
                                                  const CreatingSuggestionPageChangeEvent(
                                                      creatingSuggestionPage:
                                                          CreatingSuggestionPage
                                                              .third));
                                            } else {
                                              photoError(context);
                                            }
                                          }
                                        },
                                        text: stringsUi['next']!)
                                  ],
                                ),
                              );

                            case CreatingSuggestionPage.third:
                              return Form(
                                key: _formThirdKey,
                                child: Column(
                                  children: [
                                    Text(stringsUi['howItsShouldBe']!,
                                        style: basicTextStyle),
                                    TextFormField(
                                      minLines: 10,
                                      maxLines: 10,
                                      initialValue: state.proposedSolutionText,
                                      decoration: textFieldInputDecoration(),
                                      onChanged: (value) {
                                        bloc.add(
                                            ProposedSolutionTextChangeEvent(
                                                proposedSolutionText: value));
                                      },
                                      validator: (value) =>
                                          state.proposedSolutionTextIsValid
                                              ? null
                                              : stringsUi["emptyField"]!,
                                    ),
                                    Text(
                                      stringsUi['addPhotoOrVideo']!,
                                      style: basicTextStyle,
                                    ),
                                    Row(
                                      children: [
                                        imageWidget(
                                            context: context,
                                            heroTag: "third",
                                            imagePath:
                                                state.proposedSolutionImage,
                                            height: 58,
                                            width: 94),
                                        videoWidget(
                                            context: context,
                                            videoPath:
                                                state.proposedSolutionVideo,
                                            thumbnailPath: state
                                                .proposedSolutionVideoThumbnail,
                                            height: 58,
                                            width: 94),
                                        takePhotoButton(
                                            context: context,
                                            onPressed: (imagePath) {
                                              bloc.add(
                                                  ProposedSolutionImageChangeEvent(
                                                      proposedSolutionImage:
                                                          imagePath));
                                            }),
                                        takeVideoButton(
                                            context: context,
                                            onPressed: (videoPath) {
                                              bloc.add(
                                                  ProposedSolutionVideoChangeEvent(
                                                      proposedSolutionVideo:
                                                          videoPath));
                                            }),
                                      ],
                                    ),
                                    continueButton(
                                        onPressed: () {
                                          if (_formThirdKey.currentState!
                                              .validate()) {
                                            if (
                                                // state.existingSolutionVideoIsValid &&
                                                state
                                                    .proposedSolutionImageIsValid) {
                                              bloc.add(
                                                  const CreatingSuggestionPageChangeEvent(
                                                      creatingSuggestionPage:
                                                          CreatingSuggestionPage
                                                              .fourth));
                                            } else {
                                              photoError(context);
                                            }
                                          }
                                        },
                                        text: stringsUi['next']!)
                                  ],
                                ),
                              );

                            case CreatingSuggestionPage.fourth:
                              return Form(
                                key: _formFourthKey,
                                child: BlocProvider(
                                  create: (context) => PostSuggestionBloc(
                                      sendSuggestionProvider: RepositoryProvider
                                          .of<SendSuggestionProvider>(context)),
                                  child: BlocBuilder<PostSuggestionBloc,
                                      PostSuggestionState>(
                                    builder: (context, postingState) {
                                      final postBloc =
                                          context.watch<PostSuggestionBloc>();
                                      return Column(
                                        children: [
                                          Text(
                                            stringsUi['howItsWillBe']!,
                                            style: basicTextStyle,
                                          ),
                                          TextFormField(
                                            minLines: 10,
                                            maxLines: 10,
                                            initialValue: state.positiveEffect,
                                            decoration:
                                                textFieldInputDecoration(),
                                            onChanged: (value) {
                                              bloc.add(
                                                  PositiveEffectChangeEvent(
                                                      positiveEffect: value));
                                            },
                                            validator: (value) =>
                                                state.positiveEffectIsValid
                                                    ? null
                                                    : stringsUi["emptyField"]!,
                                          ),
                                          Builder(builder: (context) {
                                            switch (postingState.status) {
                                              case PostingStatus.initial:
                                                return continueButton(
                                                    onPressed: () {
                                                      if (_formFourthKey
                                                          .currentState!
                                                          .validate()) {
                                                        postBloc.add(PostSuggestion(
                                                            suggestionSendModel: SuggestionSendModel(
                                                                title:
                                                                    state.title,
                                                                topicId: Boxes.getTopicsBox()
                                                                    .values
                                                                    .firstWhere((element) =>
                                                                        element.title ==
                                                                        state
                                                                            .topic)
                                                                    .id!,
                                                                existingSolutionText: state
                                                                    .existingSolutionText,
                                                                existingSolutionImage: state
                                                                    .existingSolutionImage,
                                                                existingSolutionVideo:
                                                                    state
                                                                        .existingSolutionVideo,
                                                                proposedSolutionText:
                                                                    state
                                                                        .proposedSolutionText,
                                                                proposedSolutionImage:
                                                                    state
                                                                        .proposedSolutionImage,
                                                                proposedSolutionVideo:
                                                                    state
                                                                        .proposedSolutionVideo,
                                                                positiveEffect:
                                                                    state.positiveEffect)));
                                                      }
                                                    },
                                                    text: stringsUi['done']!);

                                              case PostingStatus.loading:
                                                return const CircularProgressIndicator();
                                              case PostingStatus.success:
                                                return const Icon(
                                                  Icons.done,
                                                  color: Colors.green,
                                                );
                                              case PostingStatus.error:

                                                // showAdaptiveDialog(
                                                //   context: context,
                                                //   builder: (context) {
                                                //     return Center(
                                                //       child: Container(
                                                //         height: 100,
                                                //         width: 300,
                                                //         decoration: BoxDecoration(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         15)),
                                                //         child: Column(
                                                //           children: [
                                                //             Text(
                                                //                 "Sending error try later"),
                                                //             TextButton(
                                                //                 onPressed: () {
                                                //                   bloc.add(
                                                //                       ResetCreatingEvent());
                                                //                 },
                                                //                 child:
                                                //                     Text('ok'))
                                                //           ],
                                                //         ),
                                                //       ),
                                                //     );
                                                //   },
                                                // );
                                                return Column(
                                                  children: [
                                                    Text(postingState.error!),
                                                    continueButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pushAndRemoveUntil(
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              const MainView()),
                                                                  (route) =>
                                                                      false);
                                                          bloc.add(
                                                              ResetCreatingEvent());
                                                          postBloc.add(
                                                              ResetPostingEvent());
                                                        },
                                                        text:
                                                            stringsUi['next']!)
                                                  ],
                                                );
                                            }
                                          })
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              );
                          }
                        },
                      ),
                    ),
                  )));
        },
      ),
    );
  }

  Future<dynamic> photoError(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Text(stringsUi["addPhotoOrVideo"]!),
        ),
      ),
    );
  }
}
