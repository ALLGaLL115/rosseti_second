import 'package:flutter/material.dart';
import 'package:rosseti_second/colors.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/models/suggestion_model.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/text_styles.dart';

projectCard({required Suggestion suggestion, required Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 123,
        width: double.infinity,
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(spreadRadius: -6, blurRadius: 10, color: Colors.grey)
            ]),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: suggestion.existingSolutionImage != null
                      ? DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            suggestion.existingSolutionImage!,
                          ))
                      : const DecorationImage(
                          image: AssetImage("assets/images/img.png"))),
            ),
            const Spacer(),
            SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(suggestion.title ?? stringsUi['naming']!,
                      style: basicTextStyle, overflow: TextOverflow.ellipsis),
                  const Spacer(),
                  Text(suggestion.author!.fullName ?? stringsUi["empty"]!,
                      style: basicSmallGreyTextStyle),
                  Text(
                      Boxes.getTopicsBox()
                          .values
                          //из-за этого отображаеться не все там внизу ListView ошибка но тем всего 15
                          .elementAt(suggestion.topicId! - 1)
                          .id
                          .toString(),
                      style: basicSmallTextStyle)
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
