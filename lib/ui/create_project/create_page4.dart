// import 'package:flutter/material.dart';
// import 'package:rosseti_second/first/constants/strings.dart';
// import 'package:rosseti_second/ui/widgets/widgets.dart';
// import 'package:rosseti_second/data/models/crud_models/message.dart';
// import 'package:rosseti_second/ui/pages/pages.dart';

// import '../../first/constants/constants.dart';
// import '../../data/data_providers.dart';

// class CreatePage4 extends StatefulWidget {
//   const CreatePage4({
//     super.key,
//   });

//   @override
//   State<CreatePage4> createState() => _CreatePage4State();
// }

// class _CreatePage4State extends State<CreatePage4> {
//   TextEditingController controller = TextEditingController();

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: FocusScope.of(context).unfocus,
//         child: SafeArea(
//             child: Scaffold(
//           appBar: AppBar(
//             title: const Text(create),
//             actions: getActions(context: context),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.only(bottom: 141, left: 30, right: 30),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     how_it_will_be,
//                     style: standart,
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: mainColor, width: 2),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: TextField(
//                       minLines: 10,
//                       maxLines: 10,
//                       controller: controller,
//                       style: chatTextStyle,
//                       decoration:
//                           const InputDecoration(border: InputBorder.none),
//                     ),
//                   ),
//                   const Text(
//                     add_a_photo_or_video,
//                     style: standart,
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   continueButton(onPressed: () {}, text: next)
//                 ],
//               ),
//             ),
//           ),
//         )));
//   }
// }
