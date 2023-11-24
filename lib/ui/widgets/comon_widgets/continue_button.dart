import 'package:flutter/material.dart';
import 'package:rosseti_second/strings.dart';

Widget continueButton({
  required VoidCallback onPressed,
  required String text,
}) {
  return Container(
    width: double.infinity,
    height: 58,
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          const BoxShadow(
              offset: Offset(0, 0.3), blurRadius: 0.11, spreadRadius: 0)
        ],
        borderRadius: BorderRadius.circular(24)),
    child: FilledButton(
        style: FilledButton.styleFrom(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shadowColor: Colors.black),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: mainColor),
        )),
  );
}
