import 'package:flutter/material.dart';

chatInputField(
    {required Function(String value) onChange, required Function() onSend}) {
  return Container(
    color: Colors.grey.withAlpha(40),
    child: Container(
      height: 58,
      margin: const EdgeInsets.only(left: 26, right: 26, bottom: 20, top: 5),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurStyle: BlurStyle.outer,
              blurRadius: 5,
            )
          ],
          //  color: Colors.white,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                onChanged: (value) => onChange(value),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: onSend, child: const Icon(Icons.arrow_upward))
        ],
      ),
    ),
  );
}
