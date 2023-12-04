import 'package:flutter/material.dart';
import 'package:rosseti_second/second_try/models/topic_model.dart';
import 'package:rosseti_second/strings.dart';

topicsWidget(
    {required List<Topic> items,
    required Function(Topic topic) onChooseTopic}) {
  return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: mainColor, width: 2),
      ),
      child: DropdownButton(
        icon: Image.asset("assets/images/video-player 1.png"),
        underline: null,
        isExpanded: true,
        items: items
            .map((topic) => DropdownMenuItem(
                value: topic,
                child: Text(
                  topic.title,
                  textWidthBasis: TextWidthBasis.parent,
                  style: const TextStyle(overflow: TextOverflow.clip),
                  maxLines: 2,
                )))
            .toList(),
        onChanged: (value) => onChooseTopic(value!),
      ));
}
