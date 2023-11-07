// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:rosseti_second/first/constants/strings.dart';
// import 'package:video_player/video_player.dart';

// import '../../first/constants/constants.dart';
// import '../widgets/widgets.dart';
// import '../../data/models/crud_models/message.dart';
// import '../widgets/projectCheckCard.dart';
// import 'conversation_page.dart';

// class DoExpertDissizionPage extends StatefulWidget {
//   const DoExpertDissizionPage({
//     super.key,
//   });

//   @override
//   State<DoExpertDissizionPage> createState() => _DoExpertDissizionPageState();
// }

// class _DoExpertDissizionPageState extends State<DoExpertDissizionPage> {
//   VideoPlayerController? _proposedVideoController;
//   VideoPlayerController? _existingVideoController;

//   bool haveVideo = true;

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     if (_existingVideoController != null && _proposedVideoController != null) {
//       _existingVideoController!.dispose();
//       _proposedVideoController!.dispose();
//     }
//     super.dispose();
//   }

//   double dub = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(
//         title: const Text(create),
//         actions: getActions(context: context),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 35),
//           child: ListView(shrinkWrap: true, children: []
//               // [
//               //   checkProjectCard(
//               //       title: now_its_like_this,
//               //       description: widget.suggestion.existingSolutionText ?? "",
//               //       networkImagePath: widget.suggestion.existingSolutionImage,
//               //       networkVideoPath:
//               //           widget.suggestion.existingSolutionVideo ?? "",
//               //       videoPlayerController: _existingVideoController,
//               //       context: context),
//               //   const SizedBox(
//               //     height: 25,
//               //   ),
//               //   checkProjectCard(
//               //       title: it_should_be_like_this,
//               //       description: widget.suggestion.proposedSolutionText ?? "",
//               //       networkImagePath: widget.suggestion.proposedSolutionImage,
//               //       networkVideoPath:
//               //           widget.suggestion.proposedSolutionVideo ?? "",
//               //       videoPlayerController: _proposedVideoController,
//               //       context: context),
//               //   const SizedBox(
//               //     height: 25,
//               //   ),
//               //   projectsOutputs(
//               //       title: and_then_it_will_be_like_this,
//               //       description: widget.suggestion.positiveEffect ?? ""),
//               //   const SizedBox(
//               //     height: 25,
//               //   ),
//               //   const Row(
//               //     children: [
//               //       Text(
//               //         evaluate_the_project,
//               //         textAlign: TextAlign.left,
//               //       ),
//               //     ],
//               //   ),
//               //   builderRaiting((double asdf) {
//               //     dub = asdf;
//               //     setState(() {});
//               //   }),
//               //   Padding(
//               //     padding: const EdgeInsets.all(5.0),
//               //     child: continueButton(
//               //         onPressed: () {
//               //           Navigator.of(context).push(MaterialPageRoute(
//               //             builder: (context) => const Conversation(),
//               //           ));
//               //         },
//               //         text: discuss),
//               //   ),
//               //   const SizedBox(
//               //     height: 20,
//               //   ),
//               //   //Dessizion buttons
//               //   Row(
//               //     children: [
//               //       Flexible(
//               //           child: SizedBox(
//               //         height: 58,
//               //         width: double.infinity,
//               //         child: ElevatedButton(
//               //             style: ElevatedButton.styleFrom(
//               //                 backgroundColor: mainColor,
//               //                 foregroundColor: Colors.white),
//               //             onPressed: () {},
//               //             child: const Icon(Icons.add)),
//               //       )),
//               //       const SizedBox(
//               //         width: 8,
//               //       ),
//               //       Flexible(
//               //         child: SizedBox(
//               //           height: 58,
//               //           width: double.infinity,
//               //           child: ElevatedButton(
//               //               style: ElevatedButton.styleFrom(
//               //                   backgroundColor: Colors.white,
//               //                   foregroundColor: mainColor),
//               //               onPressed: () {
//               //                 Navigator.of(context).pop();
//               //               },
//               //               child: const RotationTransition(
//               //                   turns: AlwaysStoppedAnimation(45 / 360),
//               //                   child: Icon(
//               //                     Icons.add,
//               //                   ))),
//               //         ),
//               //       )
//               //     ],
//               //   ),
//               //   const SizedBox(
//               //     height: 20,
//               //   )
//               // ],

//               )),
//     ));
//   }

//   RatingBar builderRaiting(void getRaiting(double value)) {
//     return RatingBar.builder(
//         initialRating: 4,
//         glowColor: Colors.amber,
//         unratedColor: Colors.grey.withOpacity(0.3),
//         minRating: 1,
//         direction: Axis.horizontal,
//         allowHalfRating: false,
//         itemCount: 5,
//         itemPadding: const EdgeInsets.all(8),
//         itemSize: 40,
//         itemBuilder: (context, _) => const Icon(
//               Icons.star,
//               color: Colors.amber,
//             ),
//         onRatingUpdate: (ratingValue) {
//           getRaiting(ratingValue);
//         });
//   }
// }
