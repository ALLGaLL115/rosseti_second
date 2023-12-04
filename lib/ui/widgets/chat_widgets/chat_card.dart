import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:rosseti_second/colors.dart';
import 'package:rosseti_second/second_try/models/comment_model.dart';

import 'package:rosseti_second/strings.dart';

chatCard(Comment message) {
  return Align(
    alignment: message.you == 1 ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: message.you == 1
              ? const BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
          color: message.you == 1 ? mainColor : Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 10),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: message.text != null
            ? Column(
                children: [
                  Text(
                    message.text!,
                    style: TextStyle(
                        color: message.you == 1 ? Colors.white : mainColor),
                  ),
                  Text(
                    formatDate(message.datetime!, [hh, ":", nn]),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              )
            : null,
      ),
    ),
  );
}
