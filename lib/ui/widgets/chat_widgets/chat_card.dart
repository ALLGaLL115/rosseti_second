import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:rosseti_second/second_try/models/message.dart';
import 'package:rosseti_second/strings.dart';

chatCard(Message message) {
  return Align(
    alignment:
        message.isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: message.isSendByMe
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
          color: message.isSendByMe ? mainColor : Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 10),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              message.text,
              style: TextStyle(
                  color: message.isSendByMe ? Colors.white : mainColor),
            ),
            Text(
              formatDate(message.date, [hh, ":", nn]),
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ),
      ),
    ),
  );
}
