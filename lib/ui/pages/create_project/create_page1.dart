import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti_second/second_try/blocs/done/create_project_bloc/create_project_bloc.dart';
import 'package:rosseti_second/second_try/models/topic_model.dart';
import 'package:rosseti_second/strings.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../../widgets/widgets.dart';

class SimpleW extends StatefulWidget {
  const SimpleW({super.key});

  @override
  State<SimpleW> createState() => _SimpleWState();
}

class _SimpleWState extends State<SimpleW> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CreateProjectBloc>();
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CreateProjectBloc, CreateProjectState>(
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  InputField(
                    onChange: (value) => bloc.add(TitleUpdate(title: value)),
                  ),
                  Text(
                    state.suggestion.title!,
                    style: const TextStyle(color: Colors.amber),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CreatingPage extends StatelessWidget {
  const CreatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreatingView();
  }
}

class CreatingView extends StatefulWidget {
  const CreatingView({
    super.key,
  });

  @override
  State<CreatingView> createState() => _CreatingViewState();
}

class _CreatingViewState extends State<CreatingView> {
  String? thumbnailPath;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CreateProjectBloc>();
    return BlocBuilder<CreateProjectBloc, CreateProjectState>(
      builder: (context, state) {
        return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
                appBar: AppBar(
                  title: const Text("create"),
                  leading: BackButton(
                    onPressed: () {
                      switch (state.page) {
                        case CreateProjectPage.first:
                          Navigator.of(context).pop();
                        case CreateProjectPage.second:
                          bloc.add(const CreatePageChange(
                              page: CreateProjectPage.first));
                        case CreateProjectPage.third:
                          bloc.add(const CreatePageChange(
                              page: CreateProjectPage.second));

                        case CreateProjectPage.fourth:
                          bloc.add(const CreatePageChange(
                              page: CreateProjectPage.third));
                      }
                    },
                  ),
                  actions: getActions(context: context),
                ),
                body: SingleChildScrollView(
                  child: Builder(
                    builder: (context) {
                      switch (state.page) {
                        case CreateProjectPage.first:
                          return Padding(
                            padding: const EdgeInsets.all(35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  tellAboutOffer,
                                  style: standart,
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                const Text(
                                  chooseThemeAndName,
                                  style: standart,
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                topicsWidget(
                                    items: [
                                      Topic(
                                          id: 1,
                                          title:
                                              "эксплуатация подстанций (подстанционного оборудования)")
                                    ],
                                    onChooseTopic: (topic) {
                                      bloc.add(
                                          TopicIdUpdate(topicId: topic.id!));
                                    }),
                                const SizedBox(
                                  height: 35,
                                ),
                                InputField(
                                    hintText: naming,
                                    initialText:
                                        state.suggestion.existingSolutionText,
                                    onChange: (text) {
                                      bloc.add(TitleUpdate(title: text));
                                    }),
                                const SizedBox(
                                  height: 188,
                                ),
                                continueButton(
                                    onPressed: () {
                                      if (
                                          // state.suggestion.topicId != 0 &&
                                          state.suggestion.title != "") {
                                        bloc.add(const CreatePageChange(
                                            page: CreateProjectPage.second));
                                      }
                                    },
                                    text: next),
                              ],
                            ),
                          );
                        case CreateProjectPage.second:
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                inputFieldLarge(
                                    titleText: howItsNow,
                                    initialInputText: '',
                                    onChange: (value) {
                                      bloc.add(ExistingSolutionTextUpdate(
                                          existingSolutionText: value));
                                    }),
                                const Text(
                                  addPhotoOrVideo,
                                  style: standart,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    imageWidget(
                                        context: context,
                                        imagePath: state
                                            .suggestion.existingSolutionImage!,
                                        height: 58,
                                        width: 94),
                                    videoWidget(
                                        context: context,
                                        videoPath: state
                                            .suggestion.existingSolutionVideo,
                                        thumbnailPath: thumbnailPath,
                                        height: 58,
                                        width: 94),
                                    takePhotoButton(
                                        context: context,
                                        onPressed: (imagePath) {
                                          bloc.add(ExistingSolutionImageUpdate(
                                              existingSolutionImage:
                                                  imagePath));
                                        }),
                                    takeVideoButton(
                                        context: context,
                                        onPressed: (videoPath) async {
                                          bloc.add(ExistingSolutionVideoUpdate(
                                              existingSolutionVideo:
                                                  videoPath));
                                          thumbnailPath = await VideoThumbnail
                                              .thumbnailFile(
                                            video: videoPath,
                                            imageFormat: ImageFormat.JPEG,
                                          );
                                        }),
                                  ],
                                ),
                                continueButton(
                                    onPressed: () {
                                      if (state.suggestion
                                                  .existingSolutionImage !=
                                              "" &&
                                          state.suggestion
                                                  .existingSolutionText !=
                                              "" &&
                                          state.suggestion
                                                  .existingSolutionVideo !=
                                              "") {
                                        bloc.add(const CreatePageChange(
                                            page: CreateProjectPage.third));
                                      }
                                    },
                                    text: next)
                              ],
                            ),
                          );

                        case CreateProjectPage.third:
                          return Column(
                            children: [
                              inputFieldLarge(
                                  titleText: howItsShouldBe,
                                  initialInputText: '',
                                  onChange: (value) {
                                    bloc.add(ProposedSolutionTextUpdate(value));
                                  }),
                              const Text(
                                addPhotoOrVideo,
                                style: standart,
                              ),
                              Row(
                                children: [
                                  imageWidget(
                                      context: context,
                                      imagePath: state
                                          .suggestion.proposedSolutionImage!,
                                      height: 58,
                                      width: 94),
                                  videoWidget(
                                      context: context,
                                      // videoPath: videoPath,
                                      height: 58,
                                      width: 94),
                                  takePhotoButton(
                                      context: context,
                                      onPressed: (imagePath) {
                                        bloc.add(ProposedSolutionImageUpdate(
                                            proposedSolutionImage: imagePath));
                                      }),
                                  takeVideoButton(
                                      context: context,
                                      onPressed: (videoPath) {
                                        bloc.add(ProposedSolutionVideoUpdate(
                                            proposedSolutionVideo: videoPath));
                                      }),
                                ],
                              ),
                              continueButton(
                                  onPressed: () {
                                    if (state.suggestion
                                                .proposedSolutionImage !=
                                            "" &&
                                        state.suggestion.proposedSolutionText !=
                                            "" &&
                                        state.suggestion
                                                .proposedSolutionVideo !=
                                            "") {
                                      bloc.add(const CreatePageChange(
                                          page: CreateProjectPage.fourth));
                                    }
                                  },
                                  text: next)
                            ],
                          );

                        case CreateProjectPage.fourth:
                          return Column(
                            children: [
                              inputFieldLarge(
                                  titleText: howItsWillBe,
                                  initialInputText: '',
                                  onChange: (value) {
                                    bloc.add(PositiveEffectUpdate(
                                        positiveEffect: value));
                                  }),
                              continueButton(
                                  onPressed: () {
                                    if (state.suggestion.positiveEffect != '') {
                                      bloc.add(SendSuggestionEvent());
                                    }
                                    //   Navigator.of(context).pushAndRemoveUntil(
                                    //       MaterialPageRoute(builder: (context) => MainView()),
                                    //       (route) => false);
                                  },
                                  text: next)
                            ],
                          );
                      }
                    },
                  ),
                )));
      },
    );
  }
}

// class CreatePage1 extends StatefulWidget {
//   const CreatePage1({super.key});

//   @override
//   State<CreatePage1> createState() => _CreatePage1State();
// }

// class _CreatePage1State extends State<CreatePage1> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("create"),
//           actions: getActions(context: context),
//         ),
//         body: SingleChildScrollView(
//           physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
//           child: Padding(
//             padding: const EdgeInsets.all(35),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   tellAboutOffer,
//                   style: standart,
//                 ),
//                 const SizedBox(
//                   height: 35,
//                 ),
//                 const Text(
//                   chooseThemeAndName,
//                   style: standart,
//                 ),
//                 const SizedBox(
//                   height: 35,
//                 ),
//                 topicsWidget(items: [
//                   Topic(
//                       id: 1,
//                       title:
//                           "эксплуатация подстанций (подстанционного оборудования)")
//                 ], onChooseTopic: (topic) {}),
//                 const SizedBox(
//                   height: 35,
//                 ),
//                 inputField(hintText: naming, onChange: (text) {}),
//                 const SizedBox(
//                   height: 188,
//                 ),
//                 continueButton(
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => const CreatePage2()));
//                     },
//                     text: next),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CreatePage2 extends StatefulWidget {
//   const CreatePage2({super.key});

//   @override
//   State<CreatePage2> createState() => _CreatePage2State();
// }

// class _CreatePage2State extends State<CreatePage2> {
//   String? thumbnailPath = null;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(create),
//           actions: getActions(context: context),
//         ),
//         body: SingleChildScrollView(
//             physics:
//                 const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Column(
//                 children: [
//                   inputFieldLarge(
//                       titleText: howItsNow,
//                       initialInputText: '',
//                       onChange: (value) {}),
//                   const Text(
//                     addPhotoOrVideo,
//                     style: standart,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       imageWidget(
//                           context: context,
//                           // imagePath: imagePath,
//                           height: 58,
//                           width: 94),
//                       videoWidget(
//                           context: context,
//                           // videoPath: videoPath,
//                           thumbnailPath: thumbnailPath,
//                           height: 58,
//                           width: 94),
//                       takePhotoButton(
//                           context: context, onPressed: (imagePath) {}),
//                       takeVideoButton(
//                           context: context,
//                           onPressed: (videoPath) async {
//                             thumbnailPath = await VideoThumbnail.thumbnailFile(
//                               video: videoPath,
//                               imageFormat: ImageFormat.JPEG,
//                             );
//                             setState(() {});
//                           }),
//                     ],
//                   ),
//                   continueButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => const CreatePage3()));
//                       },
//                       text: next)
//                 ],
//               ),
//             )),
//       ),
//     );
//   }
// }

// class CreatePage3 extends StatefulWidget {
//   const CreatePage3({super.key});

//   @override
//   State<CreatePage3> createState() => _CreatePage3State();
// }

// class _CreatePage3State extends State<CreatePage3> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(create),
//           actions: getActions(context: context),
//         ),
//         body: SingleChildScrollView(
//             physics:
//                 const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
//             child: Column(
//               children: [
//                 inputFieldLarge(
//                     titleText: howItsShouldBe,
//                     initialInputText: '',
//                     onChange: (value) {}),
//                 const Text(
//                   addPhotoOrVideo,
//                   style: standart,
//                 ),
//                 Row(
//                   children: [
//                     imageWidget(
//                         context: context,
//                         // imagePath: imagePath,
//                         height: 58,
//                         width: 94),
//                     videoWidget(
//                         context: context,
//                         // videoPath: videoPath,
//                         height: 58,
//                         width: 94),
//                     takePhotoButton(
//                         context: context, onPressed: (imagePath) {}),
//                     takeVideoButton(
//                         context: context, onPressed: (videoPath) {}),
//                   ],
//                 ),
//                 continueButton(
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => const CreatePage4()));
//                     },
//                     text: next)
//               ],
//             )),
//       ),
//     );
//   }
// }

// class CreatePage4 extends StatefulWidget {
//   const CreatePage4({super.key});

//   @override
//   State<CreatePage4> createState() => CreatePage4State();
// }

// class CreatePage4State extends State<CreatePage4> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(create),
//           actions: getActions(context: context),
//         ),
//         body: SingleChildScrollView(
//             physics:
//                 const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
//             child: Column(
//               children: [
//                 inputFieldLarge(
//                     titleText: howItsWillBe,
//                     initialInputText: '',
//                     onChange: (value) {}),
//                 continueButton(
//                     onPressed: () {
//                       Navigator.of(context).pushAndRemoveUntil(
//                           MaterialPageRoute(builder: (context) => MainView()),
//                           (route) => false);
//                     },
//                     text: next)
//               ],
//             )),
//       ),
//     );
//   }
// }










































// // Итого  бонусов
// // До золотого статуса
// // еще  оценок или 
// //  комментариев или предложение
