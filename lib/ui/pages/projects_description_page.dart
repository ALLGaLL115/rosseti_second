// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:rosseti_second/first/constants/strings.dart';
// import 'package:rosseti_second/data/models/crud_models/message.dart';
// import 'package:rosseti_second/ui/pages/pages.dart';
// import 'package:rosseti_second/ui/widgets/projectCheckCard.dart';
// import 'package:video_player/video_player.dart';

// import '../../first/constants/constants.dart';

// class SuggestionDescriptionPage extends StatefulWidget {
//   const SuggestionDescriptionPage({
//     super.key,
//   });

//   @override
//   State<SuggestionDescriptionPage> createState() =>
//       _SuggestionDescriptionPageState();
// }

// class _SuggestionDescriptionPageState extends State<SuggestionDescriptionPage> {
//   late VideoPlayerController _exetingVideoController;
//   late VideoPlayerController _proposedideoController;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(
//         title: const Text(create),
//         actions: getActions(context: context),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 35),
//           child: SingleChildScrollView(
//             child: Column(children: []
//                 //  [

//                 //   checkProjectCard(
//                 //       size: size,
//                 //       title: now_its_like_this,
//                 //       description: widget.suggestion.proposedSolutionText ?? "",
//                 //       networkImagePath: widget.suggestion.proposedSolutionImage ??
//                 //           "https://avatars.mds.yandex.net/i?id=3764ee6f3757f01ae5186486aa3f2bccd3c1d483-5220281-images-thumbs&n=13",
//                 //       networkVideoPath:
//                 //           widget.suggestion.existingSolutionVideo ?? "",
//                 //       videoPlayerController: _exetingVideoController,
//                 //       context: context),
//                 //   const SizedBox(
//                 //     height: 25,
//                 //   ),
//                 //   checkProjectCard(
//                 //       size: size,
//                 //       title: how_it_should_be,
//                 //       description: widget.suggestion.proposedSolutionText ?? "",
//                 //       networkImagePath: widget.suggestion.proposedSolutionImage ??
//                 //           "https://avatars.mds.yandex.net/i?id=3764ee6f3757f01ae5186486aa3f2bccd3c1d483-5220281-images-thumbs&n=13",
//                 //       networkVideoPath:
//                 //           widget.suggestion.existingSolutionVideo ?? "",
//                 //       videoPlayerController: _proposedideoController,
//                 //       context: context),
//                 //   const SizedBox(
//                 //     height: 25,
//                 //   ),
//                 //   projectsOutputs(
//                 //       title: how_it_will_be,
//                 //       description: widget.suggestion.positiveEffect ?? ""),
//                 //   const SizedBox(
//                 //     height: 25,
//                 //   ),
//                 //   const Row(
//                 //     children: [
//                 //       Text(
//                 //         evaluate_the_project,
//                 //         textAlign: TextAlign.left,
//                 //       ),
//                 //     ],
//                 //   ),
//                 //   RatingBar.builder(
//                 //       initialRating: 4,
//                 //       glowColor: Colors.amber,
//                 //       unratedColor: Colors.grey.withOpacity(0.3),
//                 //       minRating: 1,
//                 //       direction: Axis.horizontal,
//                 //       allowHalfRating: false,
//                 //       itemCount: 5,
//                 //       itemPadding: const EdgeInsets.all(8),
//                 //       itemSize: 40,
//                 //       itemBuilder: (context, _) => const Icon(
//                 //             Icons.star,
//                 //             color: Colors.amber,
//                 //           ),
//                 //       onRatingUpdate: (ratingValue) {}),
//                 //   Padding(
//                 //     padding: const EdgeInsets.all(5.0),
//                 //     child: continueButton(
//                 //         onPressed: () {
//                 //           Navigator.of(context).push(MaterialPageRoute(
//                 //             builder: (context) => const Conversation(),
//                 //           ));
//                 //         },
//                 //         text: discuss),
//                 //   ),
//                 //   const SizedBox(
//                 //     height: 20,
//                 //   )
//                 // ],

//                 ),
//           )),
//     ));
//   }
// }
